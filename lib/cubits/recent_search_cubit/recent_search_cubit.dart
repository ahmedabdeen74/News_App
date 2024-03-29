import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/recent_search_model.dart';
part 'recent_search_state.dart';
class RecentSearchCubit extends Cubit<RecentSearchState> {
  RecentSearchCubit() : super(RecentSearchInitial());
  List<RecentSearchModel>? recentSearch;
  Future<void> fetchRecentSearch() async {
    await Future.delayed(const Duration(seconds: 1));
    var kAddRecentSearch = Hive.box<RecentSearchModel>(kSearhBox);
    recentSearch = kAddRecentSearch.values.toList();
    emit(RecentSearchSuccess());
  }
}
