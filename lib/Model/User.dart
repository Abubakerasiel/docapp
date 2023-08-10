import '../Auth/sigin_up_screen.dart';

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
  PackageType? packageType;
  String? medicalIssue;
  int? package;

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
      this.medicalIssue,
      this.package,
      this.packageType});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    weight = json['weight']?.toString();
    id = json['id']?.toString();
    image = json['image']?.toString();
    phone = json['phone']?.toString();
    age = json['age']?.toString();
    email = json['email']?.toString();
    height = json['height']?.toString();
    medicalIssue = json['medical_issue']?.toString();
    package = (packageType == PackageType.byPackage) ? 5 : 50;
    if (json['gender'] != null) {
      gender = json['gender'] == Gender.male.name ? Gender.male : Gender.female;
    }
    if (json['packageType'] != null) {
      packageType = json['packageType'] == PackageType.byPackage.name
          ? PackageType.byPackage
          : PackageType.byTime;
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
    data['medical_issue'] = medicalIssue;
    data['package'] = package;
    data['packageType'] = packageType?.name;

    data['gender'] = gender?.name;
    return data;
  }
}
