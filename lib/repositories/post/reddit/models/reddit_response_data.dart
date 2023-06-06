import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/repositories/post/reddit/models/reddit_post.dart';
import 'package:reddit_posts/repositories/post/reddit/models/reddit_response_children.dart';

part 'reddit_response_data.g.dart';

@JsonSerializable()
final class RedditResponseData {
  final String? after;
  final String? before;
  final List<RedditResponseChildren>? children;

  RedditResponseData({
    this.after,
    this.before,
    required this.children,
  });

  factory RedditResponseData.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$RedditResponseDataToJson(this);

  List<RedditPost> get redditPosts =>
      children?.map((child) => child.data).toList() ?? [];

  List<Post> get posts =>
      redditPosts.map((redditPost) => redditPost.toPost()).toList();
}
