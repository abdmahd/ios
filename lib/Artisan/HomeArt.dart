import 'package:final_project/Artisan/Appel.dart';
import 'package:final_project/Client/constants.dart';
import 'package:final_project/Client/core/service/FirestoreService.dart';
import 'package:final_project/Client/core/view_model/auth_view_model.dart';

import 'package:final_project/Client/responsive.dart';
import 'package:final_project/Home/constants.dart';
import 'package:final_project/Home/screens/main/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeArt extends StatelessWidget {
  static const routeName = '/HomeClient';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuArt(),
      body: SingleChildScrollView(
        child: Column(
          children: [HeaderArt(), Appel()],
        ),
      ),
    );
  }
}

class SideMenuArt extends StatelessWidget {
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
              press: () {},
            ),
            DrawerListTile(
              title: "Profil",
              press: () {},
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

class HeaderArt extends StatelessWidget {
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
                    "Welcome to Artisan Area",
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
    TextEditingController searchKey = TextEditingController();
    return GetBuilder<FireStoreService>(
      init: FireStoreService(),
      builder: (controller) => SizedBox(
        height: 40,
        width: 300,
        child: TextFormField(
          controller: searchKey,
          decoration: InputDecoration(
            hintText: "Search",
            fillColor: secondaryColor,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: InkWell(
              onTap: () {
                controller.artisanBySearsh.clear();
                controller.searchArtisan(searchKey.text);
              },
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
