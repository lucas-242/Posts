import 'package:flutter/material.dart';
import 'package:reddit_posts/core/themes/themes.dart';

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
  });
  final VoidCallback? onTap;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
        minimumSize: MaterialStateProperty.all<Size>(const Size(5, 35)),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor != null
              ? backgroundColor!
              : context.colorsScheme.onSurface,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          foregroundColor != null
              ? foregroundColor!
              : context.colorsScheme.background,
        ),
      ),
      child: child,
    );
  }
}
