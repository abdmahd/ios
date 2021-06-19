import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireStoreUsers>(
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 900,
          width: 900,
          child: ListView.separated(
            itemCount: controller.apellModel.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
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
                          child: Image.network(
                            controller.userModel[index].pic,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name : " + controller.apellModel[index].typework,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "UserName : " + controller.apellModel[index].location,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Age : " + controller.apellModel[index].description,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
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
