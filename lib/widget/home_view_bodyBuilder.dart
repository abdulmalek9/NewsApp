import 'package:flutter/material.dart';
import 'package:news_app/widget/categorys_listview.dart';
import 'package:news_app/widget/news_list_builder.dart';
import 'package:news_app/widget/search_bar.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({
    super.key,
    required this.isSearching,
    required this.isRefrshing,
  });

  final bool isSearching;
  final bool isRefrshing;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          isSearching
              ? const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
                  ),
                )
              : const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
          const SliverToBoxAdapter(child: CategorysListView()),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          isRefrshing == true
              ? const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                )
              : const NewsListViewBuilder(categoryName: "Top"),
        ],
      ),
      isSearching == true
          ? const Positioned(
              left: 0,
              right: -2,
              top: 8,
              child: CustomSearchBar(),
            )
          : const SizedBox(
              height: 8,
            ),
    ]);
  }
}
