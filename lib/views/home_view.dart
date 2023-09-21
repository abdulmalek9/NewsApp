import 'package:flutter/material.dart';
import 'package:news_app/widget/categorys_listview.dart';
import 'package:news_app/widget/home_view_bodyBuilder.dart';
import 'package:news_app/widget/news_list_builder.dart';
import 'package:news_app/widget/search_bar.dart';

class NewsHomeView extends StatelessWidget {
  const NewsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
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
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                isSearching = !isSearching;
                print("isSearching = $isSearching");
                setState(() {});
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: HomeViewBodyBuilder(isSearching: isSearching),
        ),
      ),
    );
  }
}
