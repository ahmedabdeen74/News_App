import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/recent_search_cubit/recent_search_cubit.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/widgets/app_bar_search.dart';
import 'package:news_app/widgets/search_name_listview.dart';
import 'package:news_app/widgets/text_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static String id = 'SearchView';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  FocusNode focus = FocusNode();
 
  @override
  void initState() {
    BlocProvider.of<RecentSearchCubit>(context).fetchRecentSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboardFromScreen(context);
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: AppBarSearch(focusNode: focus),
          ),
        body: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: TextWidget(
                        text: 'Recent searches',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SearchNameListView(),
                  ],
                ),
              )
      )
    );
            }
        
  }
