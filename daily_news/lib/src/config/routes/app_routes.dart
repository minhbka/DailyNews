import 'package:daily_news/src/domain/entities/article.dart';
import 'package:daily_news/src/presentation/views/article_details_view.dart';
import 'package:daily_news/src/presentation/views/breaking_news_view.dart';
import 'package:daily_news/src/presentation/views/saved_articles_view.dart';
import 'package:flutter/material.dart';
class AppRoutes{
  static Route? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case '/':
        return _materialRoute(const BreakingNewsView());
      case '/ArticleDetailsView':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as Article,));
      case '/SavedArticlesView':
        return _materialRoute(const SavedArticleView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}