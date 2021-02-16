import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:diabtech/features/signIn/domain/repositories/signin_repository.dart';

class SignInUser {
  final SignInRepository signInRepository;

  SignInUser(this.signInRepository);

  Future<User> signInUser(
    String username,
    String name,
    String email,
    String phone,
    String id,
  ) async {
    return this.signInRepository.signInUser(username, name, email, phone, id);
  }
}
