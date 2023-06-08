import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/app_cubit.dart';
import 'package:reddit_posts/features/app_life_cycle.dart';
import 'package:reddit_posts/features/app_shell.dart';
import 'package:reddit_posts/features/home/home.dart';
import 'package:reddit_posts/features/post/cubit/post_form_cubit.dart';
import 'package:reddit_posts/features/profile/cubit/profile_cubit.dart';
import 'package:reddit_posts/repositories/post_repository/post_repository.dart';
import 'package:reddit_posts/services/notification_service/notification_service.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.postRepository,
    required this.notificationService,
  });

  final PostRepository postRepository;
  final NotificationService notificationService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (_) => AppCubit()),
        BlocProvider<HomeCubit>(create: (_) => HomeCubit(postRepository)),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
        BlocProvider<PostFormCubit>(
          create: (_) => PostFormCubit(postRepository),
        ),
      ],
      child: AppLifeCycle(
        notificationService: notificationService,
        child: MaterialApp(
          title: 'Posts',
          debugShowCheckedModeBanner: false,
          theme: ThemeSettings.light(),
          darkTheme: ThemeSettings.dark(),
          themeMode: ThemeMode.light,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.delegate.supportedLocales,
          home: const AppShell(),
        ),
      ),
    );
  }
}
