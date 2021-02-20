import 'package:diabtech/core/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllService extends StatelessWidget {
  List<Service> services = [
    Service(
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.',
      prix: '15,000 FCFA',
      regime: 'Pack Régime',
    ),
    Service(
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.',
      prix: '15,000 FCFA',
      regime: 'Pack Sport',
    ),
    Service(
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry and typesetting industry.',
      prix: '50,000 FCFA',
      regime: 'Pack Bien-être',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Nos Services',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        height: height * .7,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          itemBuilder: (BuildContext context, int index) {
            Service service = services[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (index == 1) ? primaryColor : Colors.white,
                border: Border.all(
                    color: (index == 1) ? Colors.white : primaryColor),
              ),
              width: width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      color: (index == 1) ? Colors.white : primaryColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    service.regime,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      service.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: (index == 1) ? Colors.white : Colors.black12,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    service.prix,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: width * .5,
                    margin: EdgeInsets.only(top: 20),
                    height: 35,
                    decoration: BoxDecoration(
                      color: (index == 1) ? Colors.white : primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Choisir',
                        style: TextStyle(
                          color: (index == 1) ? primaryColor : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Service {
  final String prix;
  final String regime;
  final String description;

  Service({
    @required this.prix,
    @required this.regime,
    @required this.description,
  });
}
