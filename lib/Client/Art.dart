import 'package:final_project/Client/DetailsViews.dart';
import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:final_project/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Art extends GetWidget<FireStoreUsers> {
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
                  Get.to(DetailsView(
                    model: controller.artisanModel[index],
                  ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .3,
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
                            child: Image.network(
                              controller.artisanModel[index].pic,
                              fit: BoxFit.fill,
                            )),
                      ),
                      if (Responsive.isDesktop(context))
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
                          Text(
                            "PhoneNumber : " +
                                controller.artisanModel[index].phonenumber,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "E-mai : " + controller.artisanModel[index].email,
                            style: TextStyle(color: Colors.white),
                          ),
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
