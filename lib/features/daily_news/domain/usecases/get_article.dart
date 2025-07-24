import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';


//ye 'simple -> UseCase' ko Core folder se import krke 'implemet' kiya then ArticleRepository jo
// ki ye "news_app/features/daily_news/domain/repository/article_repository.dart" is folder me
// hai aur returned kr hai hai 'articleRepository' ko 'ArticleEntity' me...

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {

    return _articleRepository.getNewsArticle();
  }




}