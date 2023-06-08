import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/core/utils/form_validator.dart';
import 'package:reddit_posts/repositories/post_repository/post_repository.dart';

part 'post_form_state.dart';

class PostFormCubit extends Cubit<PostFormState> with FormValidator {
  PostFormCubit(this._postRepository) : super(PostFormInitialState());

  final PostRepository _postRepository;

  Future<void> addPost() async {
    try {
      emit(PostFormLoadingState(post: state.post));
      await _postRepository.create(state.post);
      emit(PostFormSuccessState());
    } catch (exception) {
      emit(PostFormErrorState(
        post: state.post,
        error: 'Error: ${exception.toString()}',
      ));
    }
  }

  Future<void> updatePost() async {
    try {
      emit(PostFormLoadingState(post: state.post));
      await _postRepository.update(state.post);
      emit(PostFormSuccessState());
    } catch (exception) {
      emit(PostFormErrorState(
        post: state.post,
        error: 'Error: ${exception.toString()}',
      ));
    }
  }

  void onChangePost(Post post) {
    emit(PostFormSuccessState());
  }

  onChangePostAuthor(String value) {}

  onChangePostTitle(String value) {}

  void onChangePostDate(DateTime date) {}
}
