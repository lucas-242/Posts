import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/core/models/post.dart';

part 'reddit_post.g.dart';

@JsonSerializable()
final class RedditPost {
  final String? author;
  final String? title;
  final int? ups;
  final double? created;
  final double? createdUtc;
  @JsonKey(name: 'num_comments')
  final int? numComments;

  RedditPost({
    required this.author,
    required this.numComments,
    required this.title,
    required this.ups,
    required this.created,
    required this.createdUtc,
  });

  factory RedditPost.fromJson(Map<String, dynamic> json) =>
      _$RedditPostFromJson(json);

  Map<String, dynamic> toJson() => _$RedditPostToJson(this);

  Post toPost() => Post(
        title: title ?? '',
        author: author ?? '',
        ups: ups ?? 0,
        commentsQuantity: numComments ?? 0,
        created: createdUtc != null
            ? DateTime.fromMillisecondsSinceEpoch(createdUtc!.toInt())
            : DateTime.now(),
      );
}
