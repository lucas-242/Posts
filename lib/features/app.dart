import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/app_cubit.dart';
import 'package:reddit_posts/features/app_shell.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (_) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Posts',
        debugShowCheckedModeBanner: false,
        theme: ThemeSettings.light(),
        darkTheme: ThemeSettings.dark(),
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        home: const AppShell(),
      ),
    );
  }
}
