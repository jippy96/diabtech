import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diabtech/features/signIn/data/repositories/signin_user_implementation.dart';
import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:diabtech/utils/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial());
  SignInUserImplementation repository;
  CacheUserInfo cacheUserInfo;
  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SigninEventStart) {
      // Début du chargement : loader
      yield SigninLoading();
      // Instanciation du repo
      repository = SignInUserImplementation();
      // Génération de son UID :
      final id = DateTime.now().millisecondsSinceEpoch.toString();

      final user = await repository.signInUser(
        event.user.username,
        event.user.name,
        event.user.email,
        event.user.phone,
        id,
      );
      // Enregistrement des infos en local
      cacheUserInfo = CacheUserInfo();
      cacheUserInfo.cacheUserInfo(user);
      // Une fois terminé, on passe à l'état succeed
      yield SigninSucceed(user: user);
    }
  }
}
