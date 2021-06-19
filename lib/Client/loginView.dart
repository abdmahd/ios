import 'package:final_project/Client/ForgetPass.dart';
import 'package:final_project/Client/SignView.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import '../Home/constants.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          "Login Client",
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
              colors: [Colors.black, Colors.blue],
              begin: Alignment.center,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: kMaxWidth),
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Column(children: [
                      SizedBox(height: kDefaultPadding * 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                        child: Text(
                          " Login to unlock your Profil".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                            height: 5,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 600,
                  child: Form(
                    key: _formKey,
                    child: Expanded(
                      flex: 5,
                      child: Center(
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
                                SizedBox(height: kDefaultPadding * 1),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(23),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "*****@****.com",
                                    hintStyle: TextStyle(color: Colors.black),
                                    labelText: "Email",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onSaved: (value) {
                                    controller.email = value;
                                  },
                                  validator: (value) {
                                    return controller.validateEmail(value);
                                  },
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                SizedBox(height: kDefaultPadding * 1),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  // obscureText: true,
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
                                    labelText: "Password",
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "*******",
                                    hintStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ForgotPassword());
                                      },
                                      child: Text(
                                        "Forget password?",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Center(
                                  // ignore: deprecated_member_use
                                  child: FlatButton(
                                    color: Colors.blue,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(500.0),
                                    ),
                                    padding:
                                        EdgeInsets.only(right: 100, left: 100),
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      if (_formKey.currentState.validate()) {
                                        controller.signInWithEmailAndPassword();
                                      }
                                    },
                                    child: Text(
                                      "Login",
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
                                    "Don’t have Account ?",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(SignScreen());
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Center(
                                  child: SignInButton(
                                    Buttons.Google,
                                    text: "Sign up with Google",
                                    onPressed: () {
                                      controller.googleSignInMethod();
                                    },
                                  ),
                                )
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
