import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/add_recent_search/add_recent_search_cubit.dart';
import 'package:news_app/cubits/recent_search_cubit/recent_search_cubit.dart';
import 'package:news_app/widgets/icon_button.dart';
import 'package:news_app/widgets/text_field.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({super.key, required this.focusNode});
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 26,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: BlocConsumer<AddRecentSearchCubit, AddRecentSearchState>(
                listener: (context, state) {
                  if (state is AddRecentSearchSuccess) {
                    BlocProvider.of<RecentSearchCubit>(context)
                        .fetchRecentSearch();
                  }
                },
                builder: (context, state) {
                  return TextFieldWidget(
                    focusNode: focusNode,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
