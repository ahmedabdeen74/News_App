import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/recent_search_cubit/recent_search_cubit.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/recent_search_model.dart';
import 'package:news_app/widgets/icon_button.dart';

class SearchNameItem extends StatelessWidget {
  const SearchNameItem({super.key, required this.recentSearchModel});
  final RecentSearchModel recentSearchModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Row(
            children: [
              const IconButtonWidget(
                icon: Icon(
                  Icons.access_time_filled,
                  color: kGreyColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  recentSearchModel.searchName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButtonWidget(
                  onPressed: () {
                    recentSearchModel.delete();
                    BlocProvider.of<RecentSearchCubit>(context)
                        .fetchRecentSearch();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    size: 30,
                    color: kGreyColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
