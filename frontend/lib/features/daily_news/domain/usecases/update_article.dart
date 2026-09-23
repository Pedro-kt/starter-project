import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/usecase/usecase.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_upload_params.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class UpdateArticleUseCase
    implements UseCase<DataState<ArticleEntity>, UpdateArticleParams> {
  final ArticleRepository _repository;

  UpdateArticleUseCase(this._repository);

  @override
  Future<DataState<ArticleEntity>> call({UpdateArticleParams? params}) async {
    if (params == null) {
      throw Exception('Params cannot be null');
    }
    return await _validate(params);
  }

  Future<DataState<ArticleEntity>> _validate(UpdateArticleParams params) async {
    if (!_isValidTitle(params.title)) {
      throw Exception('Title must be between 5 and 200 characters');
    }

    if (!_isValidContent(params.content)) {
      throw Exception('Content must be at least 20 characters');
    }

    return await _repository.updateArticle(params);
  }

  bool _isValidTitle(String title) {
    return title.isNotEmpty && title.length >= 5 && title.length <= 200;
  }

  bool _isValidContent(String content) {
    return content.isNotEmpty && content.length >= 20;
  }
}
