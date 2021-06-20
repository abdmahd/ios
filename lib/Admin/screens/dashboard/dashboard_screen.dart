import 'package:final_project/Admin/gestion%20comptes/Comptes.dart';
import 'package:final_project/Admin/gestion%20reclamation/Reclamation.dart';
import 'package:final_project/Admin/screens/main/main_screen.dart';
import 'package:final_project/Admin/signalements/Signalements.dart';
import 'package:final_project/Admin/soumission/Soumission.dart';
import 'package:final_project/Client/constants.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/header.dart';

class DashboardScreen extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 200),
            Row(
              children: [
                Spacer(),
                // ignore: deprecated_member_use
                RaisedButton.icon(
                    onPressed: () {
                      Get.offAllNamed(Comptes.routeName);
                    },
                    icon: Icon(Icons.person),
                    label: Text("Account Managment")),
                Spacer(),
                // ignore: deprecated_member_use
                RaisedButton.icon(
                    onPressed: () {
                      Get.offAllNamed(Reclamation.routeName);
                    },
                    icon: Icon(Icons.mail),
                    label: Text("Complaints Managment")),
                Spacer(),
                // ignore: deprecated_member_use
                RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.post_add),
                    label: Text("Tenders Managment")),
                Spacer(),
                SizedBox(height: 300),
              ],
            ),
            Row(
              children: [
                Spacer(),
                // ignore: deprecated_member_use
                RaisedButton.icon(
                    onPressed: () {
                      Get.offAllNamed(Soumission.routeName);
                    },
                    icon: Icon(Icons.mail),
                    label: Text("Submission Managment")),
                Spacer(),
                // ignore: deprecated_member_use
                RaisedButton.icon(
                    onPressed: () {
                      Get.offAllNamed(Signalments.routeName);
                    },
                    icon: Icon(Icons.mail),
                    label: Text("Reporting Management  ")),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/admin.jpeg"),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(MainScreenAdmin.routeName);
            },
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text("Homepage", style: TextStyle(color: Colors.white)),
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
              Get.offAllNamed(MainScreen.routeName);
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

//             Expanded(
//             flex: 5,
//           child: Column(
//           children: [
