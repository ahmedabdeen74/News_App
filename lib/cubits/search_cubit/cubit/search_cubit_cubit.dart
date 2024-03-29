import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/search_service.dart';

part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchCubitInitial());
  late List<ArticleModel> article;
  searchResult({required String searchName}) async {
    emit(Searchloaded());
    try {
      article = await SearchNewsService().getNews(searchName: searchName);
      emit(Searchsuccess(articles: article));
    } catch (e) {
      emit(Searchfailure(errorMessage: e.toString()));
    }
  }
}
