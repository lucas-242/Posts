import 'package:hive/hive.dart';
import 'package:reddit_posts/core/models/post.dart';

@HiveType(typeId: 0)
final class PostHive extends Post with HiveObjectMixin {
  PostHive({
    super.id,
    required super.title,
    required super.author,
    required super.ups,
    required super.commentsQuantity,
    required super.created,
  });

  @override
  @HiveField(0)
  int get id => super.id;
  @override
  @HiveField(1)
  String get title => super.title;
  @override
  @HiveField(2)
  String get author => super.author;
  @override
  @HiveField(3)
  int get ups => super.ups;
  @override
  @HiveField(4)
  int get commentsQuantity => super.commentsQuantity;
  @override
  @HiveField(5)
  DateTime get created => super.created;
}
