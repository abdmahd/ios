import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfilView extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil".toUpperCase(),
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
                    Text(
                      'Choose Image',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Container(
                                  height: 200,
                                  width: 200,
                                  child: Image.network(
                                    controller.box.read("user")['pic'],
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Your Information',
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
                                  onSaved: (value) {
                                    if (value == null || value.isEmpty) {
                                      return controller.fullname = controller
                                          .box
                                          .read("user")['fullname'];
                                    } else {
                                      controller.fullname = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "fullname".toUpperCase(),
                                    labelText:
                                        controller.box.read("user")['fullname'],
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    if (value == null || value.isEmpty) {
                                      return controller.age =
                                          controller.box.read("user")['age'];
                                    } else {
                                      controller.age = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Age".toUpperCase(),
                                    labelText:
                                        controller.box.read("user")['age'],
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    if (value == null || value.isEmpty) {
                                      return controller.username = controller
                                          .box
                                          .read("user")['username'];
                                    } else {
                                      controller.username = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "username".toUpperCase(),
                                    labelText:
                                        controller.box.read("user")['username'],
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    if (value == null || value.isEmpty) {
                                      return controller.wilaya =
                                          controller.box.read("user")['wilaya'];
                                    } else {
                                      controller.wilaya = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "wilaya".toUpperCase(),
                                    labelText:
                                        controller.box.read("user")['wilaya'],
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                    onSaved: (value) {
                                      if (value == null || value.isEmpty) {
                                        return controller.email = controller.box
                                            .read("user")['email'];
                                      } else {
                                        controller.email = value;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: "email".toUpperCase(),
                                      labelText:
                                          controller.box.read("user")['email'],
                                      labelStyle: TextStyle(),
                                      border: OutlineInputBorder(),
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    if (value == null || value.isEmpty) {
                                      return controller.phonenumber = controller
                                          .box
                                          .read("user")['phonenumber'];
                                    } else {
                                      controller.phonenumber = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "phonenumber".toUpperCase(),
                                    labelText: controller.box
                                        .read("user")['phonenumber'],
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                FlatButton.icon(
                                    onPressed: () {
                                      formkey.currentState.save();
                                      if (formkey.currentState.validate()) {
                                        controller.updateUser();
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
