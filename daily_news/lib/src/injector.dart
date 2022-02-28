
import 'package:daily_news/src/data/datasources/remote/news_api_service.dart';
import 'package:daily_news/src/data/repositories/articles_repository_impl.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';
import 'package:daily_news/src/domain/usecases/get_articles_usecase.dart';
import 'package:daily_news/src/presentation/blocs/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
final injector = GetIt.instance;
Future<void> initializeDependencies() async {

  print("Debug: initializeDependencies");
  //Dio client
  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<ArticlesRepository>(ArticlesRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  // Blocs
  injector.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(injector()));
}