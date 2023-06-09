import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reddit_posts/core/connections/http/connection_http.dart';
import 'package:reddit_posts/data/post_database/hive_post_database/hive_post_database.dart';
import 'package:reddit_posts/data/post_database/hive_post_database/models/post_hive.dart';
import 'package:reddit_posts/data/post_database/post_database.dart';
import 'package:reddit_posts/features/app.dart';
import 'package:reddit_posts/repositories/post_repository/post_repository.dart';
import 'package:reddit_posts/repositories/post_repository/reddit/reddit_post_repository.dart';
import 'package:reddit_posts/services/notification_service/local_notification_service/local_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService = LocalNotificationService();
  final postDatabase = await _configDatabase();
  final postRepository = _configRepository(postDatabase);

  runApp(
    App(
      postRepository: postRepository,
      notificationService: notificationService,
    ),
  );
}

Future<PostDatabase> _configDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostHiveAdapter());
  return HivePostDatabase();
}

PostRepository _configRepository(PostDatabase postDatabase) {
  final connection = ConnectionHttp();
  return RedditPostRepository(connection, postDatabase);
}
