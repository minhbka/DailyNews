import 'package:daily_news/src/core/usecases/usecase.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<Article>, void>{
  final ArticlesRepository _articlesRepository;
  GetSavedArticlesUseCase(this._articlesRepository);

  @override
  Future<List<Article>> call({void params}) {
    return _articlesRepository.getSavedArticles();
  }

}