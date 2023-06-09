import 'dart:math';

import 'package:reddit_posts/core/connections/connection.dart';
import 'package:reddit_posts/core/connections/models/connection_response.dart';
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
    final response = await Future.wait([
      _connection.get(_apiUrl),
      _getLocal(),
    ]);

    final onlinePosts =
        RedditResponse.fromJson((response[0] as ConnectionResponse).json)
            .data
            .posts;

    final localPosts = response[1] as List<Post>;

    return [...onlinePosts, ...localPosts];
  }

  Future<List<Post>> _getLocal() async => _database.get();

  @override
  Future<Post> create(Post post) async {
    final posts = await _getLocal();
    final lastId = posts.isEmpty ? -1 : posts.map((e) => e.id).fold(0, max);
    final toCreate = post.copyWith(id: lastId + 1, isLocal: true);
    await _database.create(toCreate);
    return toCreate;
  }

  @override
  Future<void> delete(int id) => _database.delete(id);

  @override
  Future<void> update(Post post) async => _database.update(post);
}
