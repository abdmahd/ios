import 'package:final_project/Admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthAdmin extends StatefulWidget {
  @override
  _AuthAdminState createState() => _AuthAdminState();
}

class _AuthAdminState extends State<AuthAdmin> {
  void validate() {}
  String _passworderor = "";
  String _maileror = "";
  bool _securetext = true;

  //controller
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Admin".toUpperCase()),
      ),
      body: Padding(
        padding: EdgeInsets.all(29),
        child: Center(
          child: Form(
              autovalidate: true,
              key: formkey,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _EmailController,
                      decoration: InputDecoration(
                        hintText: "Enter the E-mail",
                        labelText: "E-mail",
                        errorText: _maileror,
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,

                      // maxLines: 3,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _PassController,
                      decoration: InputDecoration(
                        hintText: "Enter the Password",
                        labelText: "Password",
                        errorText: _passworderor,
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(),
                        prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _securetext = !_securetext;
                              });
                            },
                            icon: Icon(_securetext
                                ? Icons.remove_red_eye
                                : Icons.security)),
                      ),
                      obscureText: _securetext,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: FlatButton.icon(
                        onPressed: () {
                          if (_EmailController.text.length < 6) {
                            setState(() {
                              _maileror =
                                  " Invalid !!! \n  You have to insert at least 6 charaters";
                            });
                          }

                          if (_EmailController.text == "admin@gmail.com" &&
                              _PassController.text == "123456789") {
                            Get.to(MainScreenAdmin());
                          } else {
                            if (_PassController.text.length < 6) {
                              setState(() {
                                _passworderor =
                                    "Invalid !!! \n  You have to insert at least 6 charaters";
                              });
                            } else {
                              setState(() {
                                _passworderor =
                                    "\n \n \n \n Password or E-mail incorrect try again ";
                              });
                            }
                          }
                          if (_EmailController.text == "GBS@gmail.com" &&
                              _PassController.text == "lollol2525") {
                            Get.offAll(MainScreenAdmin());
                          } else {
                            if (_PassController.text.length < 6) {
                              setState(() {
                                _passworderor =
                                    "Invalid !!! \n  You have to insert at least 6 charaters";
                              });
                            } else {
                              setState(() {
                                _passworderor =
                                    "\n \n \n \n Password or E-mail incorrect try again ";
                              });
                            }
                          }
                        },
                        icon: Icon(Icons.login),
                        label: Text("Login"),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
