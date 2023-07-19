import '../Auth/SignUpScreen.dart';

class User {
  String? name;
  String? weight;
  String? email;
  String? id;
  String? image;
  String? phone;
  String? age;
  String? height;
  Gender? gender;
  String? medical_issue;
  int? package = 5;

  User(
      {this.name,
      this.id,
      this.email,
      this.image,
      this.phone,
      this.age,
      this.height,
      this.gender,
      this.weight,
      this.medical_issue,
      this.package = 5});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    weight = json['weight']?.toString();
    id = json['id']?.toString();
    image = json['image']?.toString();
    phone = json['phone']?.toString();
    age = json['age']?.toString();
    email = json['email']?.toString();
    height = json['height']?.toString();
    medical_issue = json['medical_issue']?.toString();
    package = int.tryParse(json['package'].toString());
    if (json['gender'] != null) {
      gender = json['gender'] == Gender.male.name ? Gender.male : Gender.female;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['weight'] = weight;
    data['id'] = id;
    data['image'] = image;
    data['age'] = age;
    data['email'] = email;
    data['phone'] = phone;
    data['height'] = height;
    data['medical_issue'] = medical_issue;
    data['package'] = package;

    data['gender'] = gender?.name;
    return data;
  }
}
