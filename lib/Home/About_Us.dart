import 'package:final_project/Home/screens/main/components/side_menu.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[700],
          title: Text(
            'About-Us',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              width: 600,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      width: 600,
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(16.0),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Le premier chapitre contient l’analyse des besoins dans lequel on indique le cahier de charge, l’identification des acteurs et les besoins qui seront présentés par des descriptions textuelles et modélisés par des diagrammes de cas d’utilisation et des diagrammes de séquence",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                              width: 180,
                              child: Container(
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Get.offAll(MainScreen());
                                      },
                                      icon: Icon(
                                        Icons.home,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        "Home-Page",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                ),
                              )),
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
