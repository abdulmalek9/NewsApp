import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app/widget/home_view_bodyBuilder.dart';

class NewsHomeView extends StatelessWidget {
  const NewsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    bool isRefreshing = false;
    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.yellow),
              )
            ],
          ),
          titleTextStyle:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
        body: LiquidPullToRefresh(
          springAnimationDurationInMilliseconds: 750,
          height: 80,
          animSpeedFactor: 4.0,
          color: Colors.amber,
          onRefresh: () async {
            setState(() {
              isRefreshing = true;
            });
            await Future.delayed(const Duration(seconds: 2));
            setState(() {
              isRefreshing = false;
              isSearching = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: HomeViewBodyBuilder(
              isSearching: isSearching,
              isRefrshing: isRefreshing,
            ),
          ),
        ),
      ),
    );
  }
}
