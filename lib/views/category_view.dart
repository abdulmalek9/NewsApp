import 'package:flutter/material.dart';
import 'package:news_app/widget/news_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 26),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: CustomScrollView(slivers: [
          NewsListViewBuilder(
            categoryName: categoryName,
          ),
        ]),
      ),
    );
  }
}
