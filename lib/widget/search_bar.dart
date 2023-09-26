import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/search_result_view.dart';
import 'package:news_app/widget/custom_pop_item.dart';

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
  String filterValue = "";

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
            valditionValue(context, filterValue);
          },
          decoration: InputDecoration(
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 16),
                  onPressed: () {
                    valditionValue(context, filterValue);
                  },
                  icon: Icon(
                    Icons.search,
                    color: searchValue.isEmpty ? color : Colors.grey,
                  ),
                ),
                PopUpMenuBuilder(context),
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

  PopupMenuButton<dynamic> PopUpMenuBuilder(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: CustomPopItem(
            itemIcon: Icons.trending_up,
            itemName: "Top",
          ),
        ),
        const PopupMenuItem(
          value: "Business",
          child: CustomPopItem(
            itemIcon: Icons.business_center,
            itemName: "Business",
          ),
        ),
        const PopupMenuItem(
          value: "Sports",
          child: CustomPopItem(
            itemIcon: Icons.sports_soccer,
            itemName: "Sports",
          ),
        ),
        const PopupMenuItem(
          value: "Entertainment",
          child: CustomPopItem(
            itemIcon: Icons.live_tv,
            itemName: "Entertainment",
          ),
        ),
        const PopupMenuItem(
          value: "Health",
          child: CustomPopItem(
            itemIcon: Icons.health_and_safety,
            itemName: "Health",
          ),
        ),
        const PopupMenuItem(
          value: "Science",
          child: CustomPopItem(
            itemIcon: Icons.science,
            itemName: "Science",
          ),
        ),
        const PopupMenuItem(
          value: "Technology",
          child: CustomPopItem(
            itemIcon: Icons.phone_android,
            itemName: "Technology",
          ),
        ),
      ],
      onSelected: (valueSelected) {
        setState(() {
          filterValue = valueSelected;
          print("onselecter ==== $filterValue");
        });
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Icon(
          Icons.filter_list,
          color: Colors.grey,
        ),
      ),
    );
  }

  void valditionValue(BuildContext context, String filterValue) {
    if (searchValue.isEmpty) {
      setState(() {
        color = searchValue.isEmpty ? Colors.red : Colors.grey;
      });
    } else {
      print("search filter ====== $filterValue");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SearchResultView(
              searchValue: searchValue,
              filterValue: filterValue.isEmpty ? "T" : filterValue,
            );
          },
        ),
      );
    }
  }
}
