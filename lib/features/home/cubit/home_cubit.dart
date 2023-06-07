import 'package:bloc/bloc.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/repositories/post_repository/post_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._postRepository) : super(HomeLoadingState());

  final PostRepository _postRepository;

  Future<void> onInit() async {
    try {
      final result = await _getPosts();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(error: exception.toString()));
    }
  }

  Future<void> onRefresh() async {
    try {
      emit(HomeLoadingState());
      final result = await _getPosts();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(error: exception.toString()));
    }
  }

  Future<List<Post>> _getPosts() async => _postRepository.get();
}
