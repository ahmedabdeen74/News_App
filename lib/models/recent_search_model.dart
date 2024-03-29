import 'package:hive_flutter/hive_flutter.dart';
part 'recent_search_model.g.dart';
@HiveType(typeId: 0)
class RecentSearchModel extends HiveObject {
  @HiveField(0)
  final String searchName;

  RecentSearchModel({required this.searchName});
}
