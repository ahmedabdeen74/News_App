import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/search_cubit/cubit/search_cubit_cubit.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/page_argument.dart';
import 'package:news_app/widgets/article_listview.dart';
import 'package:news_app/widgets/container_search_result.dart';
import 'package:news_app/widgets/icon_button.dart';
import 'package:news_app/widgets/shimmer_listview.dart';
class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});
  static String id = 'SearchResultView';
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as PageArguments;
    final text = arguments.text;
   
    return GestureDetector(
      onTap: () {
        hideKeyboardFromScreen(context);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
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
       const SizedBox(
          width: 3,
        ),
              Expanded(
                child: ContainerSearchResult(text: text)
              ),
            ],
          )
        ),
        body: BlocBuilder<SearchCubit, SearchCubitState>(
          builder: (context, state) {
            if (state is Searchloaded) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    ShimmerListView(),
                  ],
                ),
              );
            } else if (state is Searchsuccess) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    ArticleListView(articles: state.articles),
                  ],
                ),
              );
            } else {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text(
                      'No result for ',
                      ),
                    Text(
                       text,
                      style:Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
