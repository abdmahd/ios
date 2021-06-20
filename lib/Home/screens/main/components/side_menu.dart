import 'package:final_project/Admin/Auth_view/AuthAdmin.dart';
import 'package:final_project/Artisan/loginView_Art.dart';
import 'package:final_project/Client/loginView.dart';
import 'package:final_project/Home/About_Us.dart';
import 'package:final_project/Home/contactus.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: SvgPicture.asset(
            "assets/icons/imageA.svg",
            width: 0,
            height: 0,
          )),
          DrawerListTile(
            title: "Home-Screen",
            press: () {
              Get.offAll(MainScreen());
            },
          ),
          if (Responsive.isDesktop(context))
            DrawerListTile(
              title: "Admin",
              press: () {
                Get.offAll(AuthAdmin());
              },
            ),
          DrawerListTile(
            title: "client",
            press: () {
              Get.offAll(LoginView());
            },
          ),
          DrawerListTile(
            title: "Artisan",
            press: () {
              Get.to(LoginViewArt());
            },
          ),
          DrawerListTile(
            title: "About us",
            press: () {
              Get.offAll(Aboutus());
            },
          ),
          DrawerListTile(
            title: "Contact us",
            press: () {
              Get.offAll(Contact_us());
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
