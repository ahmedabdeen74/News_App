import 'package:dio/dio.dart';
import 'package:news_app/helper/api.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/article_model.dart';
class NewsService {
  Future<List<ArticleModel>> getNews({required String categoryName}) async {
    List<dynamic> response = await Api(Dio()).get(
        url:
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=ee8f2b88bc4a447b82fd92ebf01c53bb&category=$categoryName');
    return fetchNews(response);
  }

}
