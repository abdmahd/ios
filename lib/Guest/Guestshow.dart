import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:final_project/Client/loginView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/Client/responsive.dart';
import 'package:final_project/Home/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GusetShow extends StatelessWidget {
  static const routeName = '/HomeGuest';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderGuest(),
            SizedBox(
              height: 50,
            ),
            Listeguestshow(),
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

class HeaderGuest extends StatelessWidget {
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
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Center(
                    child: Text(
                      "              Hello ! \n You are now a Guest ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

class Listeguestshow extends GetWidget<FireStoreUsers> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireStoreUsers>(
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 900,
          width: 900,
          child: ListView.separated(
            itemCount: controller.artisanModel.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.offAll(LoginView());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Container(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Text(
                                "Login to see the photos",
                                style: TextStyle(color: Colors.black),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : " + controller.artisanModel[index].fullname,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "UserName : " +
                                controller.artisanModel[index].username,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Age : " + controller.artisanModel[index].age,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Profision : " +
                                controller.artisanModel[index].prof,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // ignore: deprecated_member_use
                          FlatButton.icon(
                              onPressed: () {
                                Get.offAll(LoginView());
                              },
                              icon: Icon(Icons.login),
                              label: Text(
                                "For more info Sign in ",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
