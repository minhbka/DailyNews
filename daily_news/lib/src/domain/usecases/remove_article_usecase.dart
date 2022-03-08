import 'package:daily_news/src/core/usecases/usecase.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/domain/repositories/articles_repository.dart';

class RemoveArticleUseCase implements UseCase<void, Article>{
  final ArticlesRepository _articlesRepository;
  RemoveArticleUseCase(this._articlesRepository);
  @override
  Future<void> call({Article? params}) {
    return _articlesRepository.removeArticle(params!);
  }

}