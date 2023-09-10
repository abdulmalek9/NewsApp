import 'package:flutter/material.dart';
import 'package:news_app/widget/card_category.dart';

class CategorysListView extends StatelessWidget {
  const CategorysListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const CategoryCard(
            text: "Business",
            imageName: "assets/business.png",
          );
        },
      ),
    );
  }
}
