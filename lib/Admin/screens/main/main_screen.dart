import 'package:final_project/Admin/screens/dashboard/dashboard_screen.dart';
import 'package:final_project/Admin/screens/main/components/side_menuAdmin.dart';
import 'package:final_project/Client/responsive.dart';

import 'package:flutter/material.dart';

class MainScreenAdmin extends StatelessWidget {
  static const routeName = '/MainScreenAdmin';
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
                child: SideMenuAdmin(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
