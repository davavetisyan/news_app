import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  get props => [articles, exception];
}

class RemoteArticleLoadingState extends RemoteArticleState {
  const RemoteArticleLoadingState();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articeles)
      : super(articles: articeles);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException exception)
      : super(exception: exception);
}
