import 'package:diabtech/core/colors.dart';
import 'package:diabtech/features/intro/welcome.dart';
import 'package:diabtech/features/signIn/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_bloc.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool error = false, load = false;
  bool validator() {
    if (username.text.isEmpty ||
        name.text.isEmpty ||
        email.text.isEmpty ||
        phone.text.isEmpty) {
      return false;
    } else {
      if (username.text.length >= 5 && phone.text.length >= 9) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is SigninSucceed) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Welcome(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SigninLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                // Premier container qui sera en dessous
                Container(
                  padding: EdgeInsets.only(top: 55, left: 15),
                  width: width,
                  height: height,
                  color: backColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                // Affichage du container par dessus qui va contenir les informations pour l'inscription
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * .85,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * .05),
                        Text(
                          'Veuillez remplir\nles informations\nsuivantes',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: height * .02),
                        TextField(
                          controller: username,
                          decoration: InputDecoration(
                            hintText: 'Nom d\'utilisateur *',
                          ),
                        ),
                        SizedBox(height: height * .01),
                        TextField(
                          controller: name,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            hintText: 'Prénom(s) et Nom *',
                          ),
                        ),
                        SizedBox(height: height * .01),
                        TextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          decoration: InputDecoration(
                            hintText: 'Adresse e-mail *',
                          ),
                        ),
                        SizedBox(height: height * .01),
                        TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Numéro de téléphone *',
                          ),
                        ),
                        (error)
                            ? Container(
                                width: width,
                                margin: EdgeInsets.symmetric(
                                    vertical: height * .041),
                                child: Text(
                                  'Veuillez renseigner toutes les informations.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : SizedBox(height: height * .1),
                        GestureDetector(
                          onTap: () {
                            if (validator()) {
                              final user = User(
                                id: null,
                                name: name.text,
                                username: username.text,
                                phone: phone.text,
                                email: email.text,
                              );
                              BlocProvider.of<SigninBloc>(context).add(
                                SigninEventStart(user: user),
                              );
                            } else {
                              setState(() {
                                error = true;
                              });
                            }
                          },
                          child: Container(
                            height: 55,
                            width: width,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'S\'inscrire',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 55,
                            width: width,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Annuler',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
