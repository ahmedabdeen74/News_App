
import 'package:flutter/widgets.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/widgets/text_widget.dart';

class ContainerSearchResult extends StatelessWidget {
  const ContainerSearchResult({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: TextWidget(
          text: text,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: kPrimaryColor,
        ),
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: kGrey300Color,
      ),
    );
  }
}
