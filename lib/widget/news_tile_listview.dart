import 'package:flutter/material.dart';
import 'package:news_app/widget/News_tile.dart';

class NewsTileListView extends StatelessWidget {
  const NewsTileListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5,
        (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 16.0, bottom: 8.0),
            child: NewsTile(),
          );
        },
      ),
    );
  }
}
