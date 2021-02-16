import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:meta/meta.dart';

// ignore: must_be_immutable
class UserModel extends User {
  UserModel({
    @required String username,
    @required String name,
    @required String email,
    @required String phone,
    @required String id,
  }) : super(
          email: email,
          name: name,
          phone: phone,
          username: username,
          id: id,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "name": name,
      "email": email,
      "phone": phone,
      "id": id,
    };
  }
}
