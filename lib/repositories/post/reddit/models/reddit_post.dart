import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/models/post.dart';
import 'package:reddit_posts/repositories/post/reddit/models/reddit_post_data.dart';

part 'reddit_post.g.dart';

@JsonSerializable()
final class RedditPost {
  final String? kind;
  final RedditPostData? data;

  RedditPost({
    required this.kind,
    required this.data,
  });

  factory RedditPost.fromJson(Map<String, dynamic> json) =>
      _$RedditPostFromJson(json);

  Map<String, dynamic> toJson() => _$RedditPostToJson(this);

  Post toPost() => Post(
        title: data?.title ?? '',
        author: data?.authorFullname ?? '',
        ups: data?.ups ?? 0,
        commentsQuantity: data?.numComments ?? 0,
        created: data?.createdUtc != null
            ? DateTime.fromMillisecondsSinceEpoch(data!.createdUtc)
            : DateTime.now(),
      );
}
