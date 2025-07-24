import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/routes/all_pages_route.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/dependency_injection/injection_container.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:provider/provider.dart';

import 'features/daily_news/presentation/bloc/provider/saved_article.dart';
import 'features/daily_news/presentation/pages/home/daliy_news.dart';

void main() async{
  await initializeDependencies();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context)=> sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoute.onGenerateRoutes,
        initialRoute: AppRoute.home,
        // home: const DailyNews(),

      ),
    );
  }
}