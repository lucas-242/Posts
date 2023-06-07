import 'package:reddit_posts/core/connections/connection.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/repositories/post_repository/post_repository.dart';
import 'package:reddit_posts/repositories/post_repository/reddit/models/reddit_response.dart';

final class RedditPostRepository implements PostRepository {
  RedditPostRepository(this._connection);
  final Connection _connection;
  final String _apiUrl = 'https://api.reddit.com/r/artificial/hot';

  @override
  Future<List<Post>> get() async {
    final response = await _connection.get(_apiUrl);
    return RedditResponse.fromJson(response.json).data.posts;
  }

  @override
  Future<Post> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
