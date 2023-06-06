import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/models/enums.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/app_cubit.dart';
import 'package:reddit_posts/features/profile/widgets/option_button.dart';

class Options extends StatelessWidget {
  const Options({super.key, required this.changeLanguageCallback});
  final VoidCallback changeLanguageCallback;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();

    return Column(
      children: [
        OptionButton(
          onTap: () {
            cubit.changeLanguage(AppLanguage.en);
            changeLanguageCallback();
          },
          text: AppLocalizations.current.english,
        ),
        const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSizeConstants.largeSpace),
          child: Divider(),
        ),
        OptionButton(
          onTap: () {
            //TODO: Persists language change
            cubit.changeLanguage(AppLanguage.pt);
            changeLanguageCallback();
          },
          text: AppLocalizations.current.portuguese,
        ),
      ],
    );
  }
}
