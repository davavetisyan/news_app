import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../widgets/single_article.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticleLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RemoteArticlesError) {
            return Center(
              child: Icon(Icons.refresh),
            );
          }

          if (state is RemoteArticlesDone && state.articles != null) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final currentArticle = state.articles![index];
                  return SingleArticle(currentArticle: currentArticle);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: state.articles?.length ?? 0,
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}


