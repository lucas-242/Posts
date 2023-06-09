import 'package:reddit_posts/core/models/post.dart';

abstract interface class PostDatabase {
  Future<List<Post>> get();
  Future<void> create(Post post);
  Future<void> update(Post post);
  Future<void> delete(int id);
}
