import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabtech/features/home/presentation/home.dart';
import 'package:diabtech/features/intro/intro.dart';
import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:diabtech/features/signIn/presentation/bloc/signin_bloc.dart';
import 'package:diabtech/utils/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.clearPersistence();

  // Récupération des infos de l'user du cache
  CacheUserInfo().getCachedUserInfo().then((result) {
    user = result;
    runApp(MyApp());
  });
}

User user;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc(),
      child: MaterialApp(
        title: 'Diab Tech',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: (user == null) ? Intro() : Home(),
      ),
    );
  }
}
