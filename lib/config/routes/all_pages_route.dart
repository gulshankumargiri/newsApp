
import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daliy_news.dart';
import 'package:news_app/features/daily_news/presentation/pages/saved_article/saved_article.dart';

import '../../features/daily_news/presentation/widgets/article_widget.dart';
class AppRoute{
  static const String home = '/';
  static const String saved = '/saved';
  static const String ArticleDatails = '/details';



static Route<dynamic> onGenerateRoutes(RouteSettings settings){
  switch(settings.name){
    case home:
      return MaterialPageRoute(builder: (_)=>const DailyNews());

    case saved:
      return MaterialPageRoute(builder: (_)=>const SavedArticle());
      
    case ArticleDatails :
      final args =settings.arguments as ArticleDetailsArg;
      return MaterialPageRoute(builder: (_)=>ArticleWidget(article:args.article));
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ));




  }


}}
class ArticleDetailsArg {
  final ArticleEntity article;
  ArticleDetailsArg(this.article);
}