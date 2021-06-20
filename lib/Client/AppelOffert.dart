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
        drawer: SideMenuClient(),
        appBar: AppBar(
          title: Text(
            "Fomulair",
<<<<<<< HEAD
            style: TextStyle(color: Colors.lightBlue),
=======
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(HomeCLient.routeName);
            },
            icon: Icon(Icons.arrow_back),
>>>>>>> 85170866ade64c164f257c8b00966da5a8d3ff9d
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Form(
              key: _formsKey,
              child: SizedBox(
                width: 600,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: TextFormField(
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
                          labelText: "Type Of Work",
                          hintText: "Type of Work",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
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
                      height: 60,
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
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          _formsKey.currentState.save();

                          if (_formsKey.currentState.validate()) {
                            controller.addAppele();
                          }
                        },
                        label: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(Icons.addchart_sharp),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
