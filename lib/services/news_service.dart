import 'package:dio/dio.dart';
import 'package:news_app/models/news_item_model.dart';

class NewsService {
  final Dio dio;

  final apiKey = "402e7b1e18b14ca8adf16af66a7c5317";

  NewsService(this.dio);

  Future<Map<String, dynamic>> getNewsResponse(
      {required String categoryName}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apikey=$apiKey");
    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  Future<List<NewsItemModel>> getnews({required String categoryName}) async {
    try {
      Map<String, dynamic> jsonData =
          await getNewsResponse(categoryName: categoryName);
      List<dynamic> articles = jsonData['articles'];

      List<NewsItemModel> articleList = [];
      for (var article in articles) {
        NewsItemModel newsItemModel = NewsItemModel(
            image: article['urlToImage'],
            title: article['title'],
            description: article['description']);
        articleList.add(newsItemModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
