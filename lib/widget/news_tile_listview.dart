import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';

import 'package:news_app/widget/News_tile.dart';

class NewsTileListViewe extends StatelessWidget {
  const NewsTileListViewe({super.key, required this.data});
  final List<NewsItemModel> data;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: data.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
            child: NewsTile(
              newsData: data[index],
            ),
          );
        },
      ),
    );
  }
}
