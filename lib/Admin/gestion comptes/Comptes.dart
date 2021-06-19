


import 'package:final_project/Admin/screens/dashboard/components/header.dart';
import 'package:final_project/Admin/screens/dashboard/dashboard_screen.dart';
import 'package:final_project/Client/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../responsive.dart';


class Comptes extends StatelessWidget {
 

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardComptes()),
            
          ],
        ),
      ),
    );
  }
}
class DashboardComptes extends GetWidget {

  @override
    Widget build(BuildContext context) {
    return SafeArea(
      
      child: SingleChildScrollView(
        
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            
            Header(),
            SizedBox(height: 200),
        
            Center(
              child: Row(
  
                children: [
                 Row(
  
                children: [
                     SizedBox(width: 160,),
                      Center(
                        
                        child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width * .2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                child: Row(
                                  children: [
                                    // ignore: deprecated_member_use
                                    FlatButton.icon(
                                        onPressed: (
                                         
                                        ) {
                                   //    Art();
                                        },
                                        icon: Icon(Icons.list),
                                        label: Text("Liste Artisan ")),
                                  ],
                                ),
                              ),
                      ),
                            SizedBox(width: 160,),
                             Center(
                               child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width * .2,
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
                                       // Get.offAll();
                                        },
                                        icon: Icon(Icons.list),
                                        label: Text("Liste Client")),
                                  ],
                                ),

                            ),
                             ),
                      ],
                    ),
             ],
                    ),
            ),
               
              

              ],
            ),
          
        ),
      );
  
  }
}




  