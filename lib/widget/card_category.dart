import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryData});
  final CategoryModel categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.only(top: 12.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            alignment: const Alignment(1, -1),
            fit: BoxFit.fitWidth,
            image: AssetImage(categoryData.image),
          ),
        ),
        width: 220,
        height: 120,
        child: Center(
          child: Text(
            categoryData.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
