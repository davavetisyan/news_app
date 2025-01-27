import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';

import '../../../../core/usecases/usecases.dart';
import '../entities/article.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;
  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
