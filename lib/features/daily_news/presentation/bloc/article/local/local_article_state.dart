import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articeles;

  const LocalArticleState({this.articeles});

  @override
  get props => [articeles];
}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}


class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone({super.articeles});
}