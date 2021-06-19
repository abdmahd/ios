import 'package:final_project/Client/core/view_model/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class delateaccount extends StatelessWidget {
  const delateaccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        builder: (controller) => Drawer(
              child: Center(
                child: AlertDialog(
                  title: Text("Delate ?"),
                  content: Text("Are you sur? "),
                  actions: [
                    FlatButton(
                      onPressed: () {},
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
