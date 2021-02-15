import 'package:diabtech/core/colors.dart';
import 'package:diabtech/features/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Lottie.asset(
                'assets/lottie/doctor.json',
                width: width * .6,
              ),
            ),
            SizedBox(height: height * .1),
            Text(
              'Bienvenue Floppy',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * .07),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              textAlign: TextAlign.center,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 70),
                height: 55,
                width: width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Terminer',
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
    );
  }
}
