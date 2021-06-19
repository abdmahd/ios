import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'sidebar_container.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Categories :",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Category(
            title: 'Lock Smith',
            press: () {},
          ),
          Category(
            title: 'electrician',
            press: () {},
          ),
          Category(
            title: 'Mason',
            press: () {},
          ),
          Category(
            title: 'Carpenter',
            press: () {},
          ),
          Category(
            title: 'Painter',
            press: () {},
          ),
          Category(
            title: 'Carrier ',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String title;

  final VoidCallback press;
  const Category({
    this.title,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      child: TextButton(
        onPressed: () {},
        child: Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(color: kDarkBlackColor),
            children: [],
          ),
        ),
      ),
    );
  }
}
