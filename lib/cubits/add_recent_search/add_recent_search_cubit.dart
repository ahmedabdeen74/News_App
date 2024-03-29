import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/recent_search_model.dart';

part 'add_recent_search_state.dart';

class AddRecentSearchCubit extends Cubit<AddRecentSearchState> {
  AddRecentSearchCubit() : super(AddRecentSearchInitial());
  addRecentSearch(RecentSearchModel addRecentSearch) async {
    
    var kAddRecentSearch = Hive.box<RecentSearchModel>(kSearhBox);
    await kAddRecentSearch.add(addRecentSearch);
    emit(AddRecentSearchSuccess());
  }
}
