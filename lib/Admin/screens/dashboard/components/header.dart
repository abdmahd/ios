


import 'package:final_project/Client/HomeClient.dart';
import 'package:flutter/material.dart';

import '../../../../responsive.dart';

class Header extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          if (!Responsive.isMobile(context))
            Text(
              "Adminstration".toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
      ],
    );
  }
}

