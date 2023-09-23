import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/search_result_view.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String? searchValue;
  NewsService? newsService;
  List<NewsItemModel>? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(1.8, 3.3),
              color: Colors.black38,
              blurRadius: 4,
              spreadRadius: 0.1,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: TextField(
          onChanged: (value) {
            searchValue = value;
          },
          onSubmitted: (value) {
            searchValue = value;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchResultView(searchValue: searchValue!);
                },
              ),
            );
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: const EdgeInsets.only(left: 16),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchResultView(searchValue: searchValue!);
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            border: InputBorder.none,
            hintText: "Search..",
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
