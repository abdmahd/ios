import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/service/FirestoreService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilVie extends StatefulWidget {
  static const routeName = '/ProfilClient';
  @override
  ProfilView createState() => ProfilView();
}

class ProfilView extends State<ProfilVie> {
  String _passworderor = "";
  String _maileror = "";
  bool _securePhone = true;
  bool _secureEmail = true;
  TextEditingController _userController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _wilayaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController controller = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireStoreService>(
      init: FireStoreService(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil".toUpperCase(),
            style: TextStyle(color: Colors.blue),
          ),
        ),
        drawer: SideMenuClient(),
        body: Center(
            child: Visibility(
          visible: true,
          child: Form(
              // ignore: deprecated_member_use
              autovalidate: true,
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Choose Image',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 200,
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
                        SizedBox(
                          width: 200,
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Container(
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
                        SizedBox(
                          width: 200,
                        ),
                        SizedBox(
                          width: 200,
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
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "fullname".toUpperCase(),
                                  labelText:
                                      controller.box.read("user")['fullname'],
                                  errorText: _maileror,
                                  labelStyle: TextStyle(),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _ageController,
                                decoration: InputDecoration(
                                  hintText: "Age".toUpperCase(),
                                  labelText: controller.box.read("user")['age'],
                                  errorText: _maileror,
                                  labelStyle: TextStyle(),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _userController,
                                decoration: InputDecoration(
                                  hintText: "username".toUpperCase(),
                                  labelText:
                                      controller.box.read("user")['username'],
                                  errorText: _maileror,
                                  labelStyle: TextStyle(),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _wilayaController,
                                decoration: InputDecoration(
                                  hintText: "wilaya".toUpperCase(),
                                  labelText:
                                      controller.box.read("user")['wilaya'],
                                  errorText: _maileror,
                                  labelStyle: TextStyle(),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "email".toUpperCase(),
                                  labelText:
                                      controller.box.read("user")['email'],
                                  errorText: _maileror,
                                  labelStyle: TextStyle(),
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _secureEmail = !_secureEmail;
                                        });
                                      },
                                      icon: Icon(_secureEmail
                                          ? Icons.remove_red_eye
                                          : Icons.security)),
                                ),
                                obscureText: _secureEmail,
                                keyboardType: TextInputType.numberWithOptions(),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  hintText: "phonenumber".toUpperCase(),
                                  labelText: controller.box
                                      .read("user")['phonenumber'],
                                  errorText: _maileror,
                                  labelStyle: TextStyle(),
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _securePhone = !_securePhone;
                                        });
                                      },
                                      icon: Icon(_securePhone
                                          ? Icons.remove_red_eye
                                          : Icons.security)),
                                ),
                                obscureText: _securePhone,
                                keyboardType: TextInputType.numberWithOptions(),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.vertical_align_top_rounded),
                            label: Text("Valide")),
                      ],
                    ),
                  ),
                ],
              )),
        )),
      ),
    );
  }
}
