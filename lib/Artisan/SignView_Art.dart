import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/view_model/auth_view_model_Artisan.dart';
import '../Home/constants.dart';
import 'loginView_Art.dart';

class SignScreenArt extends GetWidget<AuthViewModelArtisan> {
  final GlobalKey<FormState> _formsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.offAll(MainScreen());
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Sign Up Artisan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.lightBlue],
                begin: Alignment.center,
                end: Alignment.topLeft),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  child: Text(
                    "Creat New account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Form(
                key: _formsKey,
                child: Center(
                  child: SizedBox(
                    width: 600,
                    child: Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 00, left: 00),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.fullname = value;
                                  },
                                  validator: (value) {
                                    return controller.validateFullname(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    labelText: "Full Name",
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Full name",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.account_box,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.username = value;
                                  },
                                  validator: (value) {
                                    return controller.validateUsername(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Username",
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.verified_user,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.age = value;
                                  },
                                  validator: (value) {
                                    return controller.validateAge(value);
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Age",
                                    hintText: "Age",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.view_agenda_sharp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: kDefaultPadding * 0),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.wilaya = value;
                                  },
                                  validator: (value) {
                                    return controller.validateCity(value);
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "City ",
                                    hintText: "Wiliya",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.phonenumber = value;
                                  },
                                  validator: (value) {
                                    return controller.validatePhone(value);
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ], // Only numbers can be entered
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Phone",
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.prof = value;
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
                                    labelText: "Profession",
                                    hintText: "Profission",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.work,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.email = value;
                                  },
                                  validator: (value) {
                                    return controller.validateEmail(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "email",
                                    hintText: "****@****.com",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  obscureText: true,
                                  onSaved: (value) {
                                    controller.password = value;
                                  },
                                  validator: (value) {
                                    return controller.validatePassword(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "********",
                                    labelText: "Password",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onSaved: (value) {
                                    controller.confimP = value;
                                  },
                                  validator: (value) {
                                    return controller.validateCPassword(value);
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Confirm Password",
                                    hintStyle: TextStyle(color: Colors.black),
                                    hintText: "********",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: FlatButton(
                                    color: Colors.blue,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(500.0),
                                    ),
                                    padding:
                                        EdgeInsets.only(right: 100, left: 100),
                                    onPressed: () {
                                      _formsKey.currentState.save();

                                      if (_formsKey.currentState.validate()) {
                                        controller
                                            .createAccountWithEmailAndPasswordArt();
                                      }
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: Text(
                                    "You already have an account  ?",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(LoginViewArt());
                                    },
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
