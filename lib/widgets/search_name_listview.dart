import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/recent_search_cubit/recent_search_cubit.dart';
import 'package:news_app/models/recent_search_model.dart';
import 'package:news_app/widgets/search_name_item.dart';

class SearchNameListView extends StatelessWidget {
  const SearchNameListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentSearchCubit, RecentSearchState>(
      builder: (context, state) {
        List<RecentSearchModel> recentSearches =
            BlocProvider.of<RecentSearchCubit>(context).recentSearch ?? [];
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: recentSearches.length,
            (context, index) {
              return SearchNameItem(recentSearchModel: recentSearches[index]);
            },
          ),
        );
      },
    );
  }
}
