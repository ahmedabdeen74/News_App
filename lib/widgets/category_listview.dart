import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key, required this.controller});
  final ScrollController controller;
  final List<CategoryModel> categories = [
    CategoryModel(categoryName: 'General', icon: Icons.home),
    CategoryModel(categoryName: 'Entertainment', icon: Icons.music_video),
    CategoryModel(categoryName: 'Business', icon: Icons.business),
    CategoryModel(categoryName: 'Health', icon: Icons.health_and_safety_sharp),
    CategoryModel(categoryName: 'Science', icon: Icons.science),
    CategoryModel(categoryName: 'Sports', icon: Icons.sports),
    CategoryModel(categoryName: 'Technology', icon: Icons.computer_sharp),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            controller:controller ,
            category: categories[index],
          );
        });
  }
}
