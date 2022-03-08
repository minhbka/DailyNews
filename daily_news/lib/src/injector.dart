
import 'package:daily_news/src/core/utils/constants.dart';
import 'package:daily_news/src/data/datasources/local/app_database.dart';
import 'package:daily_news/src/data/datasources/remote/news_api_service.dart';
import 'package:daily_news/src/data/repositories/articles_repository_impl.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';
import 'package:daily_news/src/domain/usecases/get_articles_usecase.dart';
import 'package:daily_news/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:daily_news/src/domain/usecases/remove_article_usecase.dart';
import 'package:daily_news/src/domain/usecases/save_article_usecase.dart';
import 'package:daily_news/src/presentation/blocs/local_articles/local_articles_bloc.dart';
import 'package:daily_news/src/presentation/blocs/remote_articles/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
final injector = GetIt.instance;
Future<void> initializeDependencies() async {

  print("Debug: initializeDependencies");
  final database = await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);
  //Dio client
  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));

  injector.registerSingleton<ArticlesRepository>(ArticlesRepositoryImpl(injector(), injector()));

  // UseCases
  injector.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  //
  injector.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(injector()));
  injector.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(injector()));
  injector.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(injector()));
  // Blocs
  injector.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(injector()));
  injector.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(injector(), injector(), injector()));
}