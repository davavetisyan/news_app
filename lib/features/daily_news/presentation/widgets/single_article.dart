import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/article.dart';

class SingleArticle extends StatelessWidget {
  const SingleArticle({
    super.key,
    required this.currentArticle,
  });

  final ArticleEntity currentArticle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.h,
          width: 140.w,
          margin: EdgeInsets.only(top: 13),
          decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(20)),
          child: CachedNetworkImage(
            imageUrl: currentArticle.urlToImage ?? '',
            errorWidget: (context, error, stackTrace) {
              return Center(
                child: Icon(Icons.error),
              );
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(currentArticle.title ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentArticle.description ?? ''),
                Text('Author : ${currentArticle.author ?? 'unknown'} '),
                Text(currentArticle.publishedAt ?? '')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
