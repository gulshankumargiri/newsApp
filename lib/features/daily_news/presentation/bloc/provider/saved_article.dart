import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';

import '../../../../../core/resources/data_state.dart';


late final GetArticleUseCase _getArticleUseCase;
final Future<DataState<List<ArticleEntity>>> dataState= _getArticleUseCase();


class ArticleProvider with ChangeNotifier{

  final List<ArticleEntity> _saved = [];

  List<ArticleEntity> get savedList => _saved;


  void saveArticle (ArticleEntity article){
    _saved.add(article);
    notifyListeners();
  }

  void removeArticle(ArticleEntity article){
    _saved.remove(article);
    notifyListeners();
  }

  void  isSaved(ArticleEntity article){
    _saved.contains(article);
    notifyListeners();
  }
}