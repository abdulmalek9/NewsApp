import 'package:flutter/material.dart';

class NewsHomeView extends StatelessWidget {
  const NewsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
