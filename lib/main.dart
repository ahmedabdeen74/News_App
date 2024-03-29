import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/add_recent_search/add_recent_search_cubit.dart';
import 'package:news_app/cubits/article_cubit/article_cubit.dart';
import 'package:news_app/cubits/recent_search_cubit/recent_search_cubit.dart';
import 'package:news_app/cubits/search_cubit/cubit/search_cubit_cubit.dart';
import 'package:news_app/cubits/theme_cubit/cubit/theme_cubit.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/recent_search_model.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/search_result_view.dart';
import 'package:news_app/views/search_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(RecentSearchModelAdapter()); //first
  await Hive.openBox<RecentSearchModel>(kSearhBox);//second
  

  runApp(NewsApp(
    sharedPreferences: sharedPreferences,
  ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticleCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(sharedPreferences),
        ),
        BlocProvider(
          create: (context) => AddRecentSearchCubit(),
        ),
        BlocProvider(
          create: (context) => RecentSearchCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, thememode) {
          return MaterialApp(
            routes: {
              HomeView.id: (context) => const HomeView(),
              SearchView.id: (context) => const SearchView(),
              SearchResultView.id: (context) => const SearchResultView(),
            },
            theme: ThemeData(
              textTheme: const TextTheme(
                bodySmall: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontFamily: 'Pacifico',
                ),
                bodyLarge: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
                bodyMedium: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                titleSmall: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),    
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: kSecondaryColor,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: kPrimaryColor,
                ),
                color: Colors.transparent,
              ),
              iconTheme: const IconThemeData(
                color: kPrimaryColor,
                size: 32,
              ),
            ),
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                bodySmall: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 30,
                  fontFamily: 'Pacifico',
                ),
                bodyLarge: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
                bodyMedium: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                titleSmall: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: kPrimaryColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: kPrimaryColor,
                titleTextStyle: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 20,
                ),
                iconTheme: IconThemeData(
                  color: kSecondaryColor,
                ),
                elevation: 0,
              ),
              iconTheme: const IconThemeData(
                color: kSecondaryColor,
                size: 32,
              ),
              drawerTheme: const DrawerThemeData(
                backgroundColor: kPrimaryColor,
              ),
            ),
            themeMode: thememode,
            debugShowCheckedModeBanner: false,
            initialRoute: HomeView.id,
          );
        },
      ),
    );
  }
}
