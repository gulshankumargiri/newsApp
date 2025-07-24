import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/repository_impl/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/provider/saved_article.dart';

import '../features/daily_news/data/data_sources/remote/news_api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  // Dio dependency injection
  sl.registerSingleton<Dio>(Dio());

  // Dependency
  sl.registerSingleton<NewApiService>(NewApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));


  //   Usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));


  // Bloc
  sl.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(sl()));
//  Provider
// sl.registerSingleton<ArticleProvider>(ArticleProvider(sl()));
}
