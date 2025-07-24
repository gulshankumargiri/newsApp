import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constant/constant_news_api.dart';
import '../../models/article_model.dart';

part 'news_api_service.g.dart';

// ye base url ko as it is leta hai and
@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewApiService {
  factory NewApiService(Dio dio) = _NewApiService;
// ye get method ab base url me "/top-headlines " jo likh hua hai usko
//add kreta  hai base url me like : 'https://newsapi.org/v2/top-headlines'
  // ye last wala add hua hai na wahi ye add krta hai..
  @GET('/top-headlines')
// implementation wale repository se liya gya hai aur isme apikey,country,category
// sab pass kiya gya hai jo result lane ke liye important hai...

  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query('apikey') String? apikey,
    @Query('country') String? country,
    @Query('category') String? category,
  });

}
