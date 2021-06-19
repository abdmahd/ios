import 'package:contactus/contactus.dart';
import 'package:final_project/Home/controllers/MenuController.dart';
import 'package:final_project/Home/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Contact_us extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      key: _controller.scaffoldkey,
      body: Center(
        child: SizedBox(
          width: 800,
          child: ContactUs(
            logo: AssetImage('assets/images/5138237.jpg'),
            email: 'phonesaber1.ad@gmail.com',
            companyName: 'GBS',
            phoneNumber: '+213555847452',
            website: 'https://www.google.com/',
            githubUserName: 'abdmahd/final_projectvf',
            linkedinURL: 'https://www.google.com/',
            tagLine: 'Flutter Developers',
            twitterHandle: '',
            instagram: '',
            facebookHandle: '',
            cardColor: Colors.lightBlueAccent,
            companyColor: Colors.white,
            taglineColor: Colors.blue,
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
