import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:daily_news/src/domain/usecases/remove_article_usecase.dart';
import 'package:daily_news/src/domain/usecases/save_article_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticlesBloc(
      this._getSavedArticlesUseCase,
      this._saveArticleUseCase,
      this._removeArticleUseCase
      ) : super(LocalArticleLoading()) {
    on<GetAllSavedArticle>((event, emit) async{
      final articles = await _getSavedArticlesUseCase();
      emit(LocalArticlesDone(articles));
    });

    on<RemoveArticle>((event, emit) async{
      await _removeArticleUseCase(params: event.article);
      final articles = await _getSavedArticlesUseCase();
      emit(LocalArticlesDone(articles));
    });

    on<SaveArticle>((event, emit) async{
      await _saveArticleUseCase(params: event.article);
      final articles = await _getSavedArticlesUseCase();
      emit(LocalArticlesDone(articles));
    });
  }
}
