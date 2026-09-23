import 'package:flutter/material.dart';

import '../../features/daily_news/domain/entities/article.dart';
import '../../features/daily_news/presentation/pages/article_detail/article_detail.dart';
import '../../features/daily_news/presentation/pages/home/daily_news.dart';
import '../../features/daily_news/presentation/pages/saved_article/saved_article.dart';
import '../../features/daily_news/presentation/pages/upload_article_screen.dart';
import '../../features/daily_news/presentation/pages/user_articles_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String articleDetails = '/article-details';
  static const String savedArticles = '/saved-articles';
  static const String uploadArticle = '/upload-article';
  static const String userArticles = '/user-articles';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _materialRoute(const DailyNews());

      case articleDetails:
        return _materialRoute(
          ArticleDetailsView(article: settings.arguments as ArticleEntity),
        );

      case savedArticles:
        return _materialRoute(const SavedArticles());

      case uploadArticle:
        return _materialRoute(const UploadArticleScreen());

      case userArticles:
        final userId = settings.arguments as String?;
        if (userId == null) {
          return _materialRoute(const DailyNews());
        }
        return _materialRoute(UserArticlesScreen(userId: userId));

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
