import 'package:reddit_posts/core/models/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> get();
  Future<List<Post>> getLocal();
  Future<Post> create(Post post);
  Future<void> update(Post post);
  Future<void> delete(int id);
}
