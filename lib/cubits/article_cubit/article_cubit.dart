import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/article_service.dart';

part 'article_cubit_state.dart';

class ArticleCubit extends Cubit<ArticleCubitState> {
  ArticleCubit() : super(ArticleCubitInitial());
  late List<ArticleModel> articles;
  getallNews({required String categoryName}) async {
    emit(ArticleLoaded());
    try {
      articles = await NewsService().getNews(categoryName: categoryName);
      emit(ArticleSuccess(articles: articles));
    } catch (e) {
      emit(ArticleFailure(errorMessage: e.toString()));
    }
  }
 
  
  }

