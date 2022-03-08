import 'package:daily_news/src/core/utils/constants.dart';
import 'package:daily_news/src/domain/entities/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao{
  @Query("SELECT * FROM $kArticlesTableName")
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}