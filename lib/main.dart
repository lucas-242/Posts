import 'package:flutter/material.dart';
import 'package:reddit_posts/core/connections/http/connection_http.dart';

import 'features/app.dart';
import 'repositories/post_repository/reddit/reddit_post_repository.dart';

void main() {
  final connection = ConnectionHttp();
  final postRepository = RedditPostRepository(connection);

  runApp(App(postRepository: postRepository));
}
