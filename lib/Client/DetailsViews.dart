import 'package:contactus/contactus.dart';
import 'package:final_project/Artisan/model/Artisan_model.dart';
import 'package:final_project/Client/Ask.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/Signale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ArtisanModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Image.network(
                  model.pic,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 15,
              width: 30,
            ),
            Expanded(
              child: ListView(children: [
                Container(
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * 1,
                                child: ContactUs(
                                  email: model.email,
                                  tagLine: 'Contact him with E-mail',
                                  textColor: Colors.black,
                                  cardColor: Colors.white,
                                  companyColor: Colors.white,
                                  companyName: '',
                                  taglineFontWeight: FontWeight.w100,
                                  taglineColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: FlatButton.icon(
                                        onPressed: () {
                                          Get.offAll(HomeCLient());
                                        },
                                        icon: Icon(Icons.arrow_back),
                                        label: Text("Return to ")),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Get.offAll(Ask(
                                          model: model,
                                        ));
                                      },
                                      icon: Icon(Icons.add),
                                      label: Text("Ask for him ")),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: FlatButton.icon(
                                  onPressed: () {
                                    Get.offAll(Signalet(model: model));
                                  },
                                  icon:
                                      Icon(Icons.report_gmailerrorred_outlined),
                                  label: Text("Signal ")),
                            )
                          ]),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ]),
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
