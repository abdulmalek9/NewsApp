import 'package:flutter/material.dart';
import 'package:news_app/widget/categorys_listview.dart';
import 'package:news_app/widget/news_list_builder.dart';
import 'package:news_app/widget/search_bar.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({
    super.key,
    required this.isSearching,
  });

  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        isSearching == true
            ? const SliverToBoxAdapter(
                child: CustomSearchBar(),
              )
            : const SliverToBoxAdapter(
                child: SizedBox(
                  height: 8,
                ),
              ),
        const SliverToBoxAdapter(child: CategorysListView()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        const NewsListViewBuilder(categoryName: "general"),
      ],
    );
  }
}
