import 'package:daily_news/src/core/resources/data_state.dart';
import 'package:daily_news/src/core/usecases/usecase.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';
import 'package:daily_news/src/core/params/article_request.dart';

class GetArticlesUseCase implements UseCase<DataState<List<Article>>, ArticlesRequestParams>{

  final ArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({ArticlesRequestParams? params}) {
    print("Debug: GetArticlesUseCase call");

    return _articlesRepository.getBreakingNewsArticles(params);
  }

}