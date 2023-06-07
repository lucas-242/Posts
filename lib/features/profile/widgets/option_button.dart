import 'package:flutter/material.dart';
import 'package:reddit_posts/core/extensions/string_extensions.dart';
import 'package:reddit_posts/core/themes/themes.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textStyle,
  });
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSizeConstants.largeSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text.capitalize(),
              style: textStyle ?? context.titleMedium,
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
