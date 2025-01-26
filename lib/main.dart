import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/app_themes.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/injection_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  await initDependencies();

  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, _) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(
          create: (context) => sl<RemoteArticleBloc>()
            ..add(
              GetRemoteArticle(),
            ),
        ),
      ],
      child: MaterialApp(
        theme: theme(),
        home: DailyNews(),
      ),
    );
  }
}
