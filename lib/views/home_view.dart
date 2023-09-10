import 'package:flutter/material.dart';
import 'package:news_app/widget/card_category.dart';
import 'package:news_app/widget/categorys_listview.dart';

class NewsHomeView extends StatelessWidget {
  const NewsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.yellow),
            )
          ],
        ),
        titleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 16, top: 8),
        child: Column(
          children: [
            CategorysListView(),
          ],
        ),
      ),
    );
  }
}
