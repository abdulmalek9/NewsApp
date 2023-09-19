import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    super.key,
    required this.newsData,
  });

  final NewsItemModel newsData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: newsData.image != null
          ? CachedNetworkImage(
              imageUrl: newsData.image!,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : const SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  "The photo not found",
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
