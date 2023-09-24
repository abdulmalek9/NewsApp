import 'package:flutter/material.dart';
import 'package:news_app/widget/news_list_builder.dart';
import 'package:news_app/widget/search_bar.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 26),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              isSearching = !isSearching;
              setState(() {});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: CustomScrollView(slivers: [
          isSearching == true
              ? const SliverToBoxAdapter(
                  child: CustomSearchBar(),
                )
              : const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 4,
                  ),
                ),
          NewsListViewBuilder(
            categoryName: widget.categoryName,
          ),
        ]),
      ),
    );
  }
}
