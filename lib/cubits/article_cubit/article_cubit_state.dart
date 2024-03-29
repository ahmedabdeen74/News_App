part of 'article_cubit.dart';

@immutable
sealed class ArticleCubitState {}

final class ArticleCubitInitial extends ArticleCubitState {}

final class ArticleLoaded extends ArticleCubitState {}

final class ArticleSuccess extends ArticleCubitState {
 final List<ArticleModel> articles;

  ArticleSuccess({required this.articles});
}
final class ArticleFailure extends ArticleCubitState {
  final String errorMessage;

  ArticleFailure({required this.errorMessage});
}
