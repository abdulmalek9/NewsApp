import 'package:flutter/material.dart';
import 'package:news_app/widget/news_list_builder.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, this.searchValue, this.filterValue});
  final String? searchValue;
  final String? filterValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Result"),
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
              searchValue: searchValue, filterValue: filterValue),
        ]),
      ),
    );
  }
}
