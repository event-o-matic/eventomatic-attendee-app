
import 'package:eventomaticattendeeapp/data/constraints.dart';

class User {
  String id;
  String fullName;
  String email;
  String phone;
  String wPhone;
  String role;
  String avatar;
  String gender;
  List<String> utils;

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.wPhone,
    this.avatar,
    this.gender = "male",
    this.role = "anonymous",
    this.utils,
  })  : assert(Constraints.genders.contains(gender)),
        assert(Constraints.userRoles.contains(role));


  factory User.fromJson(Map<String, dynamic> json) {
      return User(
        id: json['_id'],
        fullName: json["fullname"],
        email: json["email"],
        role: json["category"],
        utils: json['utils'].cast<String>(),
      );
  }

//  TODO: impl. toJson factory
}
