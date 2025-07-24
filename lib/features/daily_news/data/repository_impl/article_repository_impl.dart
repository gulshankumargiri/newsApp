import 'package:dio/dio.dart';
import 'package:news_app/core/constant/constant_news_api.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{

  final NewApiService _newApiService;
  ArticleRepositoryImpl(this._newApiService);

  @override
// api call hone pe isme data aayega then
  Future<DataState<List<ArticleModel>>> getNewsArticle() async{
    try {
// ye news_api_Service ko call krega
      final httpResponse = await _newApiService.getNewsArticle(
        apikey: apiKey,
        category: categoryQuery,
        country: country,
      );

// agar data ka response.statuscode 200 raha to "DataSuccess" me jayega
// jo "news_app/ core/ resources/ data_state.dart" is folder me hai ,
// otherwise DioException me jayega.

      if (httpResponse.response.statusCode == 200) {
        // print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions,
            )
        );
      }
    }on DioException catch (e){
      return DataFailed(e);

    }
  } 



}