part of 'home_cubit.dart';

abstract class HomeState {
  HomeState({
    required this.posts,
    this.error,
  });

  final List<Post> posts;
  final String? error;
}

final class HomeSuccessState extends HomeState {
  HomeSuccessState({required super.posts});
}

final class HomeErrorState extends HomeState {
  HomeErrorState({super.posts = const [], required super.error});
}

final class HomeLoadingState extends HomeState {
  HomeLoadingState({super.posts = const []});
}
