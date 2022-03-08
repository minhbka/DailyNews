part of 'local_articles_bloc.dart';

@immutable
abstract class LocalArticlesState extends Equatable{
  final List<Article>? articles;
  const LocalArticlesState({this.articles});

  @override
  List<Object?> get props =>[articles];
}

class LocalArticleLoading extends LocalArticlesState {
  const LocalArticleLoading();
}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<Article>? article):super(articles: article);
}
