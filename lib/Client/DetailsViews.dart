import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  ArtisanModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: Image.network(
                model.pic,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
              width: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : " + model.username,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Fullname : " + model.fullname,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Age : " + model.age,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Wilaya : " + model.wilaya,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Profission : " + model.prof,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "E-mail : " + model.email,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Phonenumber : " + model.phonenumber,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              children: [
                                // ignore: deprecated_member_use
                                FlatButton.icon(
                                    onPressed: () {
                                      Get.offAll(HomeCLient());
                                    },
                                    icon: Icon(Icons.arrow_back),
                                    label: Text("Return to ")),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // ignore: deprecated_member_use
                                FlatButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.shop),
                                    label: Text("Ask for him"))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
