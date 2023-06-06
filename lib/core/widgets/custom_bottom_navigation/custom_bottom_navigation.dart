import 'package:flutter/material.dart';
import 'package:reddit_posts/core/extensions/extensions.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/widgets/custom_bottom_navigation/widgets/bottom_navigation_button.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentPage;
  final void Function(int) onTap;
  const CustomBottomNavigation({
    Key? key,
    this.currentPage = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          BottomNavigationButton(
            onTap: () => onTap(0),
            icon: Icons.home,
            label: AppLocalizations.current.home.capitalize(),
            isSelected: currentPage == 0,
          ),
          BottomNavigationButton(
            onTap: () => onTap(1),
            icon: Icons.language,
            label: AppLocalizations.current.languages.capitalize(),
            isSelected: currentPage == 1,
          ),
        ],
      ),
    );
  }
}
