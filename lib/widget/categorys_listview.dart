import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widget/card_category.dart';

class CategorysListView extends StatelessWidget {
  const CategorysListView({
    super.key,
  });

  final List<CategoryModel> categoryData = const [
    CategoryModel(image: "assets/business.png", name: "Business"),
    CategoryModel(image: "assets/entertaiment.png", name: "Entertainment"),
    CategoryModel(image: "assets/health.png", name: "Health"),
    CategoryModel(image: "assets/science.png", name: "Science"),
    CategoryModel(image: "assets/sports.png", name: "Sports"),
    CategoryModel(image: "assets/technology.png", name: "Technology"),
    CategoryModel(image: "assets/general.png", name: "Top"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryData.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            categoryData: categoryData[index],
          );
        },
      ),
    );
  }
}
