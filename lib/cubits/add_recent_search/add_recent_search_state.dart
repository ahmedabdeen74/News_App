part of 'add_recent_search_cubit.dart';

@immutable
sealed class AddRecentSearchState {}

final class AddRecentSearchInitial extends AddRecentSearchState {}
final class AddRecentSearchSuccess extends AddRecentSearchState {}
