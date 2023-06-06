import 'package:flutter/material.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/core/widgets/custom_safe_area/custom_safe_area.dart';
import 'package:reddit_posts/features/profile/widgets/options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizeConstants.largeSpace,
                  right: AppSizeConstants.largeSpace,
                  top: AppSizeConstants.largeSpace,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      width: 120.0,
                      height: 120.0,
                      // child: CircleAvatar(
                      //   backgroundImage: user.photoUrl != null
                      //       ? NetworkImage(user.photoUrl!)
                      //       : null,
                      //   backgroundColor: AppColors.white,
                      //   child: user.photoUrl == null
                      //       ? Text(
                      //           '🦆',
                      //           style:
                      //               context.cardTitle!.copyWith(fontSize: 80),
                      //         )
                      //       : null,
                      // ),
                    ),
                    AppSizeConstants.largeVerticalSpacer,
                    Text(
                      AppLocalizations.current.selectLanguage,
                      style: context.titleMedium,
                    ),
                    AppSizeConstants.largeVerticalSpacer,
                    const Divider(),
                  ],
                ),
              ),
              Options(
                changeLanguageCallback: () => setState(() {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
