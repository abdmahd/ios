import 'package:final_project/Client/loginView.dart';
import 'package:final_project/Guest/Guestshow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../../responsive.dart';
import '../../../constants.dart';

class Socal extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(GusetShow());
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical:
                  kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: Text("Continue  as Guest"),
        ),
      ],
    );
  }
}
