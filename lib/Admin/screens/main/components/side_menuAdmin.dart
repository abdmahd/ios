import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.notification_add,
              color: Colors.white,
            ),
            title: Text("Notification", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text("Settings", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            onTap: () {
              Get.offAll(MainScreen());
            },
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text("logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
