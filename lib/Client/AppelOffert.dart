import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppleOffer extends StatelessWidget {
  static const routeName = '/AppeleOffertClient';
  final GlobalKey<FormState> _formsKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Fomulair",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.to(HomeCLient());
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Form(
              key: _formsKey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    onSaved: (value) {
                      controller.typework = value;
                    },
                    validator: (value) {
                      return controller.validateFullname(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Type Of Work",
                      hintText: "Type of Work",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    onSaved: (value) {
                      controller.location = value;
                    },
                    validator: (value) {
                      return controller.validateCity(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Location",
                      hintText: "Location",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    onSaved: (value) {
                      controller.description = value;
                    },
                    validator: (value) {
                      return controller.validateCity(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Description",
                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        _formsKey.currentState.save();

                        if (_formsKey.currentState.validate()) {
                          controller.addAppele();
                        }
                      },
                      child: Text("Add"))
                ],
              )),
        ),
      ),
    );
  }
}
