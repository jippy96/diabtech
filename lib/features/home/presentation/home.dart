import 'package:diabtech/core/colors.dart';
import 'package:diabtech/features/services/presentation/all_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int n = 6;
  List<String> content = [
    'Diabète',
    'Services',
    'Consultation',
  ];
  List<String> content2 = [
    'Nutrition',
    'Hygiène',
    'Conseil',
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: height * .5,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(width * .3),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prendre soin\nde votre santé!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Bonjour Floppy',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          minRadius: 25,
                          child: Text(
                            'F',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    for (var i = 0; i < n / 2; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: width * .4,
                              width: width * .4,
                              child: GestureDetector(
                                onTap: () {
                                  switch (i) {
                                    case 0:
                                      break;
                                    case 1:
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => AllService(),
                                        ),
                                      );
                                      break;
                                    case 2:
                                      break;
                                    default:
                                  }
                                },
                                child: Card(
                                  child:
                                      Center(child: Text(content.elementAt(i))),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: width * .4,
                              width: width * .4,
                              child: Card(
                                child:
                                    Center(child: Text(content2.elementAt(i))),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
