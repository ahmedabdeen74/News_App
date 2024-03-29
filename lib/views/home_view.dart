import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/article_cubit/article_cubit.dart';
import 'package:news_app/views/drawer_bar.dart';
import 'package:news_app/views/search_view.dart';
import 'package:news_app/widgets/article_listview.dart';
import 'package:news_app/widgets/icon_button.dart';
import 'package:news_app/widgets/shimmer_listview.dart';
import 'package:news_app/widgets/text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    BlocProvider.of<ArticleCubit>(context)
        .getallNews(categoryName: 'general');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //iconTheme: const IconThemeData(size: 35, color: kPrimaryColor),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const TextWidget(
                text: 'Cloud',
                color: Colors.yellow,
                fontSize: 30,
                fontFamily: 'Pacifico'),
          ],
        ),
        actions: [
          IconButtonWidget(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.id);
            },
            icon: const Icon(
              Icons.search_sharp,
            ),
          ),
        ],
      ),
      drawer:  DrawerBar(controller: controller),
      body: BlocBuilder<ArticleCubit, ArticleCubitState>(
        builder: (context, state) {
          if (state is ArticleLoaded) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomScrollView(
               physics: BouncingScrollPhysics(),
                slivers: [
                  ShimmerListView(),
                ],
              ),
            );
          } else if (state is ArticleSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
                slivers: [ArticleListView(articles: state.articles)],
              ),
            );
          } else {
            return const Text('opps there was an error,try later');
          }
        },
      ),
    );
  }
}
