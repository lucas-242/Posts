import 'package:flutter/material.dart';

import 'widgets/custom_scroll_behavior.dart';
import 'widgets/padding_wrap.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    super.key,
    this.onRefresh,
    this.child,
    this.padding,
  });

  final Future<void> Function()? onRefresh;
  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: onRefresh != null
            ? RefreshIndicator(
                onRefresh: onRefresh!,
                child: PaddingWrap(
                  padding: padding,
                  child: child,
                ),
              )
            : PaddingWrap(
                padding: padding,
                child: child,
              ),
      ),
    );
  }
}
