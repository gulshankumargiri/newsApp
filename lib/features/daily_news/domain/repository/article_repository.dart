 // ye repository domain layer and data layer ke bich ek
 // bridge ka kam krta hai

 import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
 }