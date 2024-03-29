import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/article_item.dart';
class ArticleListView extends StatelessWidget {
  const ArticleListView({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return
     SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
          (context, index) {
        return ArticleItem(
          article: articles[index],
        );
      }),
    );
  }
}
