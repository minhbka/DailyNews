import 'package:daily_news/src/core/params/article_request.dart';
import 'package:daily_news/src/core/resources/data_state.dart';
import 'package:daily_news/src/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams? params);
}
