import 'package:final_project/Client/AppelOffert.dart';
import 'package:final_project/Client/Art.dart';
import 'package:final_project/Client/ProfilView.dart';
import 'package:final_project/Client/constants.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';

import 'package:final_project/Client/responsive.dart';
import 'package:final_project/Home/constants.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCLient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuClient(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderClien(),
            SizedBox(
              height: 30,
            ),
            Art()
          ],
        ),
      ),
    );
  }
}

class SideMenuClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: SvgPicture.asset(
              "assets/icons/imageA.svg",
              width: 0,
              height: 0,
            )),
            DrawerListTile(
              title: "Home-Page",
              press: () {
                Get.offAll(AppleOffer());
              },
            ),
            DrawerListTile(
              title: "Profil",
              press: () {
                Get.offAll(ProfilVie());
              },
            ),
            DrawerListTile(
              title: "Setings",
              press: () {},
            ),
            DrawerListTile(
              title: "About us",
              press: () {},
            ),
            DrawerListTile(
              title: "Contact us",
              press: () {},
            ),
            DrawerListTile(
              title: "Log out",
              press: () {
                Get.offAll(MainScreen());
              },
            ),
          ],
        ),
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

class HeaderClien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueAccent[700],
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/imageA.svg",
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topRight, child: SearchField()),
                  SizedBox(height: kDefaultPadding * 2),
                  Text(
                    "Welcome to Client Area",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (Responsive.isDesktop(context))
                    SizedBox(height: kDefaultPadding),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
