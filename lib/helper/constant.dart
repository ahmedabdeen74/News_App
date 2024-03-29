import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

const Color kPrimaryColor = Colors.black;
const Color kSecondaryColor = Colors.white;
const Color kGreyColor = Colors.grey;
final Color kGrey300Color = Colors.grey[300]!;
const kSearhBox = 'search';
void hideKeyboardFromScreen(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(48),
    borderSide: BorderSide(
      color: kGrey300Color,
    ),
  );
}

List<ArticleModel> fetchNews(List<dynamic> response) {
  List<ArticleModel> articlesList = [];
  for (int i = 0; i < response.length; i++) {
    ArticleModel article = ArticleModel.fromjeson(response[i]);
    articlesList.add(article);
  }
  return articlesList;
}
