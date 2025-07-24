import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';

abstract class RemoteArticleState extends Equatable{

  final List<ArticleEntity> ? articles;
  final DioException ? error;
  const RemoteArticleState({this.articles,this.error});

  @override
  List<Object?> get props =>[articles!,error!];
}

class RemoteArticlesLoading extends RemoteArticleState{
  const RemoteArticlesLoading();

}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticleError extends RemoteArticleState{
  const RemoteArticleError({required DioException error}) : super(error: error);
}