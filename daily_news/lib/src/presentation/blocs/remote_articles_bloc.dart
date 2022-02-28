import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:daily_news/src/core/bloc/bloc_with_state.dart';
import 'package:daily_news/src/core/params/article_request.dart';
import 'package:daily_news/src/core/resources/data_state.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/usecases/get_articles_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc extends BlockWithState<RemoteArticlesEvent, RemoteArticlesState> {

  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase):super(const RemoteArticlesLoading()) {
    print("Debug: init RemoteArticlesBloc");
    on<GetArticles>((event, emit) async{
      final dataState = await _getArticlesUseCase(
          params: ArticlesRequestParams(page: _page)
      );
      print("Debug: data state ${dataState.data}");
      if(dataState is DataSuccess && dataState.data != null && dataState.data!.isNotEmpty){
        final articles = dataState.data!;
        final noMoreData = articles.length < _pageSize;
        _article.addAll(articles);
        _page++;
        emit(RemoteArticlesDone(_article, noMoreData: noMoreData));
      }
      if(dataState is DataFailed){
        emit(RemoteArticlesError(dataState.error));
      }
    });
  }
  final List<Article> _article = [];
  int _page = 1;
  static const int _pageSize = 20;


  // Stream<RemoteArticlesState> _getBreakingNewsArticle(RemoteArticlesEvent event) async*{
  //   print("Debug: _getBreakingNewsArticle");
  //   yield* runBlocProcess(() async*{
  //     print("Debug: runBlocProcess");
  //     final dataState = await _getArticlesUseCase(
  //       params: ArticlesRequestParams(page: _page)
  //     );
  //     print("Debug: ${dataState.data}");
  //     if(dataState is DataSuccess && dataState.data != null && dataState.data!.isNotEmpty){
  //       final articles = dataState.data!;
  //       final noMoreData = articles.length < _pageSize;
  //       _article.addAll(articles);
  //       _page++;
  //       yield RemoteArticlesDone(_article, noMoreData: noMoreData);
  //     }
  //     if(dataState is DataFailed){
  //       yield RemoteArticlesError(dataState.error);
  //     }
  //   });
  // }
}
