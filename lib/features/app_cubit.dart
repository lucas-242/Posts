import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/models/enums.dart';
import 'package:reddit_posts/features/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
            AppPage.home,
            Locale.fromSubtags(languageCode: 'en'),
          ),
        );

  void changePage(AppPage newPage) => emit(AppState(newPage, state.locale));

  void changeLanguage(AppLanguage language) {
    final Locale locale;
    switch (language) {
      case AppLanguage.en:
        locale = const Locale.fromSubtags(languageCode: 'en');
        break;
      case AppLanguage.pt:
        locale = const Locale.fromSubtags(languageCode: 'pt');
        break;
    }
    AppLocalizations.delegate.load(locale);
    emit(AppState(state.page, locale));
  }
}
