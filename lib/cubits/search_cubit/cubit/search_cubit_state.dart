part of 'search_cubit_cubit.dart';

@immutable
sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}

final class Searchloaded extends SearchCubitState {}

final class Searchsuccess extends SearchCubitState {
  final List<ArticleModel> articles;

  Searchsuccess({required this.articles});
}

final class Searchfailure extends SearchCubitState {
  final String errorMessage;

  Searchfailure({required this.errorMessage});
}
