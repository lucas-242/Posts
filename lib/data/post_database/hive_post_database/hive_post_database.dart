import 'package:hive/hive.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/data/post_database/hive_post_database/models/post_hive.dart';
import 'package:reddit_posts/data/post_database/post_database.dart';

final class HivePostDatabase implements PostDatabase {
  final String _boxName = 'posts';
  Box<PostHive>? _box;

  @override
  Future<void> create(Post post) async {
    final postsBox = await _openBox();
    return postsBox.put(post.id, post as PostHive);
  }

  @override
  Future<void> delete(int id) async {
    final postsBox = await _openBox();
    return postsBox.delete(id);
  }

  @override
  Future<List<Post>> get() async {
    final postsBox = await _openBox();
    return postsBox.values.toList();
  }

  @override
  Future<void> update(Post post) async {
    final postsBox = await _openBox();
    return postsBox.putAt(post.id, post as PostHive);
  }

  Future<Box<PostHive>> _openBox() async {
    if (_box == null) {
      final isOpen = Hive.isBoxOpen(_boxName);
      _box = isOpen ? Hive.box(_boxName) : await Hive.openBox(_boxName);
    }
    return _box!;
  }
}
