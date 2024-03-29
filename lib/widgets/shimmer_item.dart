import 'package:flutter/material.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/widgets/container_widget.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ContainerWidget(
              kHeight: 220,
              kWidth: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            ContainerWidget(
              kHeight: 27,
              kWidth: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
           ContainerWidget(
              kHeight: 27,
              kWidth: 290,
            ),
          SizedBox(
              height: 18,
            ),
          ]),
          baseColor: kGrey300Color,
          highlightColor: kGrey300Color,
    );
  }
}
