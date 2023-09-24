import 'package:dio/dio.dart';
import 'package:news_app/models/news_item_model.dart';

class NewsService {
  final Dio dio;

  final apiKey = "pub_299854793cd341000aa83fd812f7ceeb40618";

  NewsService(this.dio);

  Future<Map<String, dynamic>> getNewsResponse(
      {required String categoryName}) async {
    Response response = await dio.get(
        "https://newsdata.io/api/1/news?apikey=$apiKey&category=$categoryName&image=1&country=sa,eg,es,sy,gb");
    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  Future<Map<String, dynamic>> getSearchNewsResponse(
      {required String searchValue}) async {
    Response response = await dio.get(
        "https://newsdata.io/api/1/news?apikey=$apiKey&q=$searchValue&image=1");
    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  Future<List<NewsItemModel>> getnews(
      {String? categoryName, String? searchValue}) async {
    List<dynamic> articles;
    if (categoryName != null) {
      Map<String, dynamic> jsonData =
          await getNewsResponse(categoryName: categoryName);
      articles = jsonData['results'];
    } else {
      Map<String, dynamic> jsonData =
          await getSearchNewsResponse(searchValue: searchValue!);
      articles = jsonData['results'];
    }

    List<NewsItemModel> articleList = [];
    for (var article in articles) {
      NewsItemModel newsItemModel = NewsItemModel(
          image: article['image_url'],
          title: article['title'],
          description: article['description'],
          url: article['link']);
      articleList.add(newsItemModel);
    }
    return articleList;
  }
}










// class NewsService {
//   final Dio dio;

//   //final apiKey = "402e7b1e18b14ca8adf16af66a7c5317";
  
//   NewsService(this.dio);

//   Future<Map<String, dynamic>> getNewsResponse(
//       {required String categoryName}) async {
//     Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apikey=$apiKey");
//     Map<String, dynamic> jsonData = response.data;

//     return jsonData;
//   }

//   Future<Map<String, dynamic>> getSearchNewsResponse(
//       {required String searchValue}) async {
//     Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?q=${searchValue}&apikey=$apiKey");
//     Map<String, dynamic> jsonData = response.data;

//     return jsonData;
//   }

//   Future<List<NewsItemModel>> getnews(
//       {String? categoryName, String? searchValue}) async {
//     List<dynamic> articles;
//     if (categoryName != null) {
//       Map<String, dynamic> jsonData =
//           await getNewsResponse(categoryName: categoryName);
//       articles = jsonData['articles'];
//     } else {
//       Map<String, dynamic> jsonData =
//           await getSearchNewsResponse(searchValue: searchValue!);
//       articles = jsonData['articles'];
//     }

//     List<NewsItemModel> articleList = [];
//     for (var article in articles) {
//       NewsItemModel newsItemModel = NewsItemModel(
//           image: article['urlToImage'],
//           title: article['title'],
//           description: article['description'],
//           url: article['url']);
//       articleList.add(newsItemModel);
//     }
//     return articleList;
//   }
// }
