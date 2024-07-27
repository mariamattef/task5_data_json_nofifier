import 'package:flutter/material.dart';
import 'package:task_5/pages/persons_page.dart';

void main() {
  runApp(const Task5());
}

class Task5 extends StatelessWidget {
  const Task5({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PersonsPage(),
    );
  }
}
