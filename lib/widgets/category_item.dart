import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/article_cubit/article_cubit.dart';

import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.controller,
  });
  final CategoryModel category;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<ArticleCubit>(context)
              .getallNews(categoryName: category.categoryName);
          Navigator.of(context).pop();
          controller.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn
              );
        },
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                category.icon,
                size: 35,
                // color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              category.categoryName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
