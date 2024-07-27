import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_5/models/person_model.dart';

var getDataNotifier = ValueNotifier(false);

class PersonsPage extends StatefulWidget {
  const PersonsPage({super.key});

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  List<Employee> employees = [];
  bool isLoading = false;
  String errorMessag = '';
  @override
  initState() {
    initdata();
    super.initState();
  }

  void initdata() async {
    getDataNotifier.value = isLoading;

    var result = await rootBundle.loadString('assets/data.json');
    var response = jsonDecode(result);
    if (response['success'] == true && response['status'] == 200) {
      employees = List<Employee>.from(
          response['data'].map((person) => Employee.fromJson(person)).toList());
    } else {
      errorMessag = '>>>>>>>>>>> ${response['status']}';
    }

    getDataNotifier.value = !isLoading;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persons'),
      ),
      body: ValueListenableBuilder(
          valueListenable: getDataNotifier,
          builder: (context, value, _) {
            return Center(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : errorMessag.isEmpty
                        ? ListView(
                            children: employees
                                .map((employee) => ListTile(
                                      leading: CircleAvatar(
                                          child: Text(employee.age.toString())),
                                      title: Text(employee.name.toString()),
                                      subtitle: Text(employee.phone.toString()),
                                      trailing: Text(
                                        employee.address?.city ?? "Egypt",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14),
                                      ),
                                    ))
                                .toList(),
                          )
                        : Center(
                            child: Text(errorMessag),
                          ));
          }),
    );
  }
}
