import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/theme_cubit/cubit/theme_cubit.dart';
import 'package:news_app/widgets/category_listview.dart';
import 'package:news_app/widgets/text_widget.dart';
class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Image.asset('assets/general.jpg'),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const TextWidget(
                text: 'Cloud',
                color: Colors.yellow,
                fontFamily: 'Pacifico',
                fontSize: 30,
              ),
            ],
          ),
          Expanded(child: CategoryListView(controller: controller,)),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).changeTheme();
                  },
                  icon:themeMode==ThemeMode.light?const Icon(
                    Icons.wb_sunny_outlined,
                    size: 34,
                    
                  ): const Icon(
                Icons.brightness_2_outlined,
                size: 28,
                          ),
                ),
              );
            },
          ),
          /* IconButtonWidget(
            onPressed: () {
              
            },
            icon:const Icon(
              Icons.brightness_3_rounded,
              size: 28,
            ),
            ),*/
        ],
      ),
    );
  }
}
