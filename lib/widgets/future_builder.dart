/*
import 'package:flutter/material.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/article_service.dart';
import 'package:news_app/widgets/article_listview.dart';
import 'package:news_app/widgets/shimmer_listview.dart';
import 'package:news_app/widgets/text_widget.dart';
class ArticlesFutureBuilder extends StatefulWidget {
  const ArticlesFutureBuilder({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<ArticlesFutureBuilder> createState() => _ArticlesFutureBuilderState();
}

class _ArticlesFutureBuilderState extends State<ArticlesFutureBuilder> {
  late Future<List<ArticleModel>>future  ;
  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ArticleListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Column(
                children: [
                  TextWidget(
                    text: 'opps there was an error',
                    color: kPrimaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  TextWidget(
                    text: 'try again',
                    color: kGreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            );
          } else {
            return const ShimmerListView();
          }
        });
  }
}
*/