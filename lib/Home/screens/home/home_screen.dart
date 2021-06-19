import 'package:final_project/Home/models/Blog.dart';
import 'package:flutter/material.dart';
import '../../../responsive.dart';
import '../../constants.dart';
import 'components/blog_post.dart';
import 'components/categories.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Column(
                children: List.generate(
                  blogPosts.length,
                  (index) => BlogPostCard(
                    blog: blogPosts[0],
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  blog2Posts.length,
                  (index) => BlogPostCard2(
                    blog: blog2Posts[0],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 23,
        ),

        if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                //   Search(),
                Categories(),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
      ],
    );
  }
}
