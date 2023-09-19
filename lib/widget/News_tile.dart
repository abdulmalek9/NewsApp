import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/widget/image_builder.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsData});
  final NewsItemModel newsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageBuilder(newsData: newsData),
        const SizedBox(
          height: 8,
        ),
        Text(
          newsData.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          newsData.description ?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
