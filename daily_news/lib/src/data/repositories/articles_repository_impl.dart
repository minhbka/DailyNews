import 'dart:io';
import 'package:daily_news/src/core/params/article_request.dart';
import 'package:daily_news/src/core/resources/data_state.dart';
import 'package:daily_news/src/data/datasources/local/app_database.dart';
import 'package:daily_news/src/data/datasources/remote/news_api_service.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';
import 'package:dio/dio.dart';
class ArticlesRepositoryImpl implements ArticlesRepository{
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  const ArticlesRepositoryImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(ArticlesRequestParams? params) async {
    print("Debug: ArticlesRepositoryImpl getBreakingNewsArticles");
    try{
      print("Debug: ArticlesRepositoryImpl httpResponse");
      print("Debug: params ${params?.category} ${params?.pageSize} ${params?.apiKey}, ${params?.country} ");
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params?.apiKey,
        country: params?.country,
        category: params?.category,
        page: params?.page,
        pageSize: params?.pageSize
      );
      print("Debug: ${httpResponse.response.statusCode}");
      if (httpResponse.response.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch(e){
      print("Debug: $e");
      return DataFailed(e);
    }
  }

  @override
  Future<List<Article>> getSavedArticles() {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) {
    return _appDatabase.articleDao.insertArticle(article);
  }

}