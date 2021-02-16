import 'package:diabtech/features/signIn/domain/entities/user.dart';

abstract class SignInRepository {
  Future<User> signInUser(
    String username,
    String name,
    String email,
    String phone,
    String id,
  );
}
