import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/search_result_view.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String searchValue = '';
  NewsService? newsService;
  List<NewsItemModel>? data;
  Color? color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13, bottom: 16),
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 18, right: 5),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(1.8, 3.3),
              color: Colors.black38,
              blurRadius: 4,
              spreadRadius: 0.1,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(14)),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: TextField(
          onTapOutside: (event) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          onChanged: (value) {
            searchValue = value;
            setState(() {});
          },
          onSubmitted: (value) {
            searchValue = value;
            valditionValue(context);
          },
          decoration: InputDecoration(
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 16),
                  onPressed: () {
                    valditionValue(context);
                  },
                  icon: Icon(
                    Icons.search,
                    color: searchValue.isEmpty ? color : Colors.grey,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
            border: InputBorder.none,
            hintText: "Search..",
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  void valditionValue(BuildContext context) {
    if (searchValue.isEmpty) {
      setState(() {
        color = searchValue.isEmpty ? Colors.red : Colors.grey;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SearchResultView(searchValue: searchValue);
          },
        ),
      );
    }
  }
}
