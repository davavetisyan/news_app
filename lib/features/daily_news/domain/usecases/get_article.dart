import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/data/model/article_model.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) async {
    return await _articleRepository.getNewsArticles();
  }
}
