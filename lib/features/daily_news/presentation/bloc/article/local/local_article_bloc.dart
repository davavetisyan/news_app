import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final RemoveArticleUseCase _removeArticle;
  final SaveArticleUseCase _saveArticle;
  final GetSavedArticleUseCase _getSavedArticles;

  LocalArticleBloc(
      this._getSavedArticles, this._saveArticle, this._removeArticle)
      : super(LocalArticlesLoading()) {
    on<GetSavedArticles>(_onGetSavedArticles);
    on<RemoveArticle>(_onRemoveArticle);
    on<SaveArticle>(_onSaveArticle);
  }

  _onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticles();

    emit(LocalArticlesDone(articeles: articles));
  }

  _onRemoveArticle(RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await _removeArticle();

    _onGetSavedArticles(GetSavedArticles(), emit);
  }

  _onSaveArticle(SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticle();

    _onGetSavedArticles(GetSavedArticles(), emit);
  }
}
