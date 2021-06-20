import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class deleteArtisan extends StatelessWidget {
  ArtisanModel model;

  deleteArtisan({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireStoreUsers>(
        init: FireStoreUsers(),
        builder: (controller) => Drawer(
              child: Center(
                child: AlertDialog(
                  title: Text("Delate ?"),
                  content: Text("Are you sur? "),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        controller.getDeleteUser(model.artisanId);
                        controller.launchURL();
                      },
                      child: Text("YES"),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text("No"),
                    ),
                  ],
                  elevation: 24.0,
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
            ));
  }
}
