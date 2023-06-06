import 'package:flutter/material.dart';
import 'package:reddit_posts/core/themes/themes.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.padding = EdgeInsets.zero,
    this.color = AppColors.black,
  });

  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final String label;
  final bool isSelected;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? context.colorsScheme.primary
        : context.colorsScheme.onPrimaryContainer;

    final fontWeight = isSelected ? FontWeight.w500 : FontWeight.w400;

    return Expanded(
      child: Padding(
        padding: padding,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              AppSizeConstants.tinyVerticalSpacer,
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
