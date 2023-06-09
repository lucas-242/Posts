import 'dart:math';

import 'package:reddit_posts/core/connections/connection.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/data/post_database/post_database.dart';
import 'package:reddit_posts/repositories/post_repository/post_repository.dart';
import 'package:reddit_posts/repositories/post_repository/reddit/models/reddit_response.dart';

final class RedditPostRepository implements PostRepository {
  RedditPostRepository(this._connection, this._database);
  final Connection _connection;
  final String _apiUrl = 'https://api.reddit.com/r/artificial/hot';
  final PostDatabase _database;

  @override
  Future<List<Post>> get() async {
    final response = await _connection.get(_apiUrl);
    return RedditResponse.fromJson(response.json).data.posts;
  }

  @override
  Future<List<Post>> getLocal() async => _database.get();

  @override
  Future<Post> create(Post post) async {
    final posts = await getLocal();
    final lastId = posts.isEmpty ? -1 : posts.map((e) => e.id).fold(0, max);
    final toCreate = post.copyWith(id: lastId);
    await _database.create(toCreate);
    return toCreate;
  }

  @override
  Future<void> delete(int id) => _database.delete(id);

  @override
  Future<void> update(Post post) async => _database.update(post);
}
