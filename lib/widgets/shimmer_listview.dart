import 'package:flutter/material.dart';
import 'package:news_app/widgets/shimmer_item.dart';
class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
        return  ShimmerItem();
      }),
    );
  }
}
