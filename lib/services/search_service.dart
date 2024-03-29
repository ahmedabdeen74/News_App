import 'package:dio/dio.dart';
import 'package:news_app/helper/api.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/article_model.dart';
class SearchNewsService {
  Future<List<ArticleModel>> getNews({required String searchName}) async {
    List<dynamic> response = await Api(Dio()).get(
        url:
            'https://newsapi.org/v2/everything?q=$searchName&apiKey=ee8f2b88bc4a447b82fd92ebf01c53bb');
    return fetchNews(response);
  }

}
