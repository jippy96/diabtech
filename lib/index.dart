import 'package:diabtech/core/colors.dart';
import 'package:diabtech/features/home/presentation/home.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<Widget> pages = [
    Home(),
    Container(),
    Container(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        iconSize: 26,
        items: _items(),
        selectedFontSize: 12,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 30,
        ),
        label: "Accueil",
      ),
      BottomNavigationBarItem(
        icon: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: (_index == 1) ? primaryColor : Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        label: "Savoir plus",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          size: 30,
        ),
        label: "Mon Profil",
      ),
    ];
  }
}
