import 'package:flutter/material.dart';
import 'package:news_app/helper/constant.dart';
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.kHeight, required this.kWidth});
  final double kHeight;
  final double kWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16)),
      height: kHeight,
      width: kWidth,
    );
  }
}
