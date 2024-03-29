import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/add_recent_search/add_recent_search_cubit.dart';
import 'package:news_app/cubits/search_cubit/cubit/search_cubit_cubit.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/page_argument.dart';
import 'package:news_app/models/recent_search_model.dart';
import 'package:news_app/views/search_result_view.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.focusNode,
  });
  final FocusNode focusNode;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller = TextEditingController();
  late String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: widget.focusNode,
      onTap: () {
        FocusScope.of(context).requestFocus(widget.focusNode);
      },
      cursorColor: kPrimaryColor,
      onSubmitted: (data) {
        text = data;
        Navigator.of(context).pushNamed(SearchResultView.id,
            arguments: PageArguments(text, widget.focusNode));
        BlocProvider.of<AddRecentSearchCubit>(context)
            .addRecentSearch(RecentSearchModel(
          searchName: text,
        ));
        BlocProvider.of<SearchCubit>(context).searchResult(searchName: text);
        controller.clear();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: kGrey300Color,
        suffixIcon: Icon(
          Icons.search,
          color: widget.focusNode.hasFocus ? kPrimaryColor : kGreyColor,
        ),
        hintText: 'Search',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
