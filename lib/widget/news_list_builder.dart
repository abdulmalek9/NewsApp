import 'package:dio/dio.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widget/news_tile_listview.dart';
import 'package:flutter/material.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  dynamic future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getnews(categoryName: widget.categoryName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItemModel>>(
        future: future,
        builder: (context, snapshote) {
          if (snapshote.hasData) {
            return NewsTileListViewe(
              data: snapshote.data!,
            );
          } else if (snapshote.hasError) {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text("Opps There is an error, Please try again."),
              ),
            );
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
