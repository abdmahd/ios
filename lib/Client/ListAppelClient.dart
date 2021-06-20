import 'package:final_project/Client/Editappels.dart';
import 'package:final_project/Client/HomeClient.dart';
import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAppelClinet extends StatelessWidget {
  static const routeName = '/AppeleOffertClient';
  final GlobalKey<FormState> _formsKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireStoreUsers>(
      init: FireStoreUsers(),
      builder: (controller) => Scaffold(
        drawer: SideMenuClient(),
        appBar: AppBar(
          title: Text(
            "My Appels" + controller.box.read("user")['fullname'],
            style: TextStyle(color: Colors.lightBlue),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 900,
            width: 900,
            child: ListView.separated(
                itemCount: controller.apell.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(HomeCLient());
                    },
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .99,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Type de work : " +
                                        controller.apell[index].typework +
                                        "\nWilaya : " +
                                        controller.apell[index].location +
                                        "\nDescription : " +
                                        controller.apell[index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .22,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: FlatButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.delete),
                                              label: Text("Delete"))),
                                      Spacer(),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .22,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 4,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: FlatButton.icon(
                                              onPressed: () {
                                                Get.offAll(Editappels(
                                                  model:
                                                      controller.apell[index],
                                                ));
                                              },
                                              icon: Icon(Icons.edit),
                                              label: Text("Edit"))),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 100,
                    )),
          ),
        ),
      ),
    );
  }
}
