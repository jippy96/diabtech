import 'package:diabtech/core/colors.dart';
import 'package:diabtech/features/intro/welcome.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool validator() {
    if (username.text.isEmpty ||
        name.text.isEmpty ||
        email.text.isEmpty ||
        phone.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
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
                    SizedBox(height: height * .1),
                    Text(
                      'Veuillez remplir\nles informations\nsuivantes',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: height * .05),
                    TextField(
                      controller: username,
                      decoration: InputDecoration(
                        hintText: 'Nom d\'utilisateur',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Prénom(s) et Nom',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Adresse e-mail',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Numéro de téléphone',
                      ),
                    ),
                    SizedBox(height: height * .1),
                    GestureDetector(
                      onTap: () {
                        // if (validator()) {

                        // }else{

                        // }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ),
                        );
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
      ),
    );
  }
}
