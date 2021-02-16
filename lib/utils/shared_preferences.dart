import 'dart:convert';

import 'package:diabtech/features/signIn/data/models/user_model.dart';
import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_USER_INFO = 'CACHED_NUMBER_TRIVIA';

class CacheUserInfo {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CacheUserInfo();

  // Fonction qui met en cache les informations de l'user
  Future<bool> cacheUserInfo(UserModel user) async {
    final SharedPreferences sharedPreferences = await _prefs;
    final userString = json.encode(user.toJson());
    return sharedPreferences.setString(CACHED_USER_INFO, userString);
  }

  // Fonction qui renvoie du cache les informations de l'user
  Future<User> getCachedUserInfo() async {
    final SharedPreferences sharedPreferences = await _prefs;
    final stringUser = sharedPreferences.getString(CACHED_USER_INFO);
    User user;
    if (stringUser != null) {
      user = UserModel.fromJson(json.decode(stringUser));
    }
    return user;
  }
}
