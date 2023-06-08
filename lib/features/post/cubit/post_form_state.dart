part of 'post_form_cubit.dart';

abstract class PostFormState extends Equatable {
  const PostFormState({required this.post, this.error});

  final Post post;
  final String? error;

  @override
  List<Object?> get props => [post];
}

final class PostFormInitialState extends PostFormState {
  PostFormInitialState({Post? post}) : super(post: post ?? _defaultPost);
}

final class PostFormSuccessState extends PostFormState {
  PostFormSuccessState() : super(post: _defaultPost);
}

final class PostFormLoadingState extends PostFormState {
  const PostFormLoadingState({required super.post});
}

final class PostFormErrorState extends PostFormState {
  const PostFormErrorState({required super.post, required super.error});
}

Post get _defaultPost => Post(
      title: '',
      author: '',
      ups: 0,
      commentsQuantity: 0,
      created: DateTime.now(),
    );
