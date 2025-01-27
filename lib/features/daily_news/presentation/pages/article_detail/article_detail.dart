import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';

import '../../../../../injection_container.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key, required this.articleEntity});

  final ArticleEntity articleEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalArticleBloc>(
      
      create: (BuildContext context) {
        return sl<LocalArticleBloc>();
      },

      
      
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            context
                .read<LocalArticleBloc>()
                .add(SaveArticle(article: articleEntity));
          },
          icon: Icon(
            Icons.save,
            color: Colors.white,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(
              20,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleEntity.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    articleEntity.urlToImage ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          child: Icon(Icons.error),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          child: CupertinoActivityIndicator(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(articleEntity.description ?? ""),
                  Text(articleEntity.content ?? ''),
                  Text('Author : ${articleEntity.author} '),
                  Text(articleEntity.publishedAt ?? ''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
