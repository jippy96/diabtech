import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  final String username;
  final String name;
  final String email;
  final String phone;
  String id;

  User({
    this.username,
    this.name,
    this.email,
    this.phone,
    this.id,
  });
  @override
  List<Object> get props => [username, name, email, phone, id];
}
