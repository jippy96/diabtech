import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabtech/features/signIn/data/models/user_model.dart';
import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:diabtech/features/signIn/domain/repositories/signin_repository.dart';

class SignInUserImplementation implements SignInRepository {
  @override
  Future<User> signInUser(
    String username,
    String name,
    String email,
    String phone,
    String id,
  ) async {
    UserModel userModel = UserModel(
      phone: phone,
      email: email,
      name: name,
      username: username,
      id: id,
    );
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');

    await userCollection.doc(id).set(userModel.toJson());
    return userModel;
  }
}
