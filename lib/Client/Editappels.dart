import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';
import 'package:final_project/Client/model/apeel_model.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Editappels extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ApellModel model;

  Editappels({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Appel".toUpperCase(),
            style: TextStyle(color: Colors.blue),
          ),
        ),
        drawer: SideMenuClient(),
        body: Center(
            child: SizedBox(
          width: 600,
          child: Visibility(
            child: Form(
                autovalidate: true,
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Edit Your call Informations',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  onSaved: (value) {},
                                  decoration: InputDecoration(
                                    hintText: "Type of work".toUpperCase(),
                                    labelText: model.typework,
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (value) {},
                                  decoration: InputDecoration(
                                    hintText: "Location".toUpperCase(),
                                    labelText: model.location,
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (value) {},
                                  decoration: InputDecoration(
                                    hintText: "Description".toUpperCase(),
                                    labelText: model.description,
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                FlatButton.icon(
                                    onPressed: () {
                                      formkey.currentState.save();
                                      if (formkey.currentState.validate()) {
                                        controller.updateappel();
                                      }
                                    },
                                    icon:
                                        Icon(Icons.vertical_align_top_rounded),
                                    label: Text("Valide")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        )),
      ),
    );
  }
}
