import 'package:reddit_posts/models/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> get();
  Future<Post> create();
  Future<void> update();
  Future<void> delete();
}
