class Employee {
  int? id;
  String? name;
  int? age;
  String? phone;
  String? country;
  Address? address;

  Employee(
      {this.id, this.name, this.age, this.phone, this.country, this.address});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    phone = json['phone'];
    country = json['country'];
    address =
        json.containsKey('address') ? Address.fromjson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['phone'] = phone;
    data['country'] = country;
    data['address'] = address;
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  Address({this.street, this.city, this.state});
  Address.fromjson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
  }
}
