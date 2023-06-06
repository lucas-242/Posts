import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit_posts/core/models/enums.dart';

final class AppState extends Equatable {
  const AppState(this.page, this.locale);

  final AppPage page;
  final Locale locale;

  @override
  List<Object?> get props => [page, locale];
}
