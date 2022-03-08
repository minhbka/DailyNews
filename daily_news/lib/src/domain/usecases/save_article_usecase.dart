import 'package:daily_news/src/core/usecases/usecase.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';

class SaveArticleUseCase implements UseCase<void, Article>{
  final ArticlesRepository _articlesRepository;
  SaveArticleUseCase(this._articlesRepository);
  @override
  Future<void> call({Article? params}) {
    return _articlesRepository.saveArticle(params!);
  }

}