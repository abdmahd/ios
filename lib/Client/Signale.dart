import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signalet extends StatelessWidget {
  final GlobalKey<FormState> _formsKey = GlobalKey<FormState>();

  ArtisanModel model;

  Signalet({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text("Signal  : " + model.fullname + "."),
              ),
              body: Center(
                child: ListView(padding: EdgeInsets.all(29), children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Please Enter Your needs Mr." +
                        controller.box.read("user")['fullname'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text("Notification : your E-mail :" +
                      controller.box.read('user')['email']),
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 600,
                    child: Center(
                      child: Form(
                          key: _formsKey,
                          autovalidate: true,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  onSaved: (value) {
                                    controller.typeraport = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Type of raport",
                                    labelText: "Enter the Type of raport ",
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  onSaved: (value) {
                                    controller.descriptionsignal = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "- - - - - - - - - - - ",
                                    labelText: "Description of the work",
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                        child: Center(
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: FlatButton.icon(
                              onPressed: () {
                                Get.offAll(HomeCLient());
                              },
                              icon: Icon(Icons.arrow_back),
                              label: Text("Anuller ")),
                        ),
                        Spacer(),
                        Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: FlatButton.icon(
                                onPressed: () {
                                  _formsKey.currentState.save();
                                  if (_formsKey.currentState.validate()) {
                                    controller.addSignal(model.artisanId);
                                  }
                                },
                                icon: Icon(Icons.publish_sharp),
                                label: Text("Submit")))
                      ]),
                    )),
                  ),
                ]),
              ),
            ));
  }
}
