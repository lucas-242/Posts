import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/repositories/post/reddit/models/reddit_post.dart';

part 'reddit_response_children.g.dart';

@JsonSerializable()
final class RedditResponseChildren {
  final String kind;
  final RedditPost data;

  RedditResponseChildren({
    required this.kind,
    required this.data,
  });

  factory RedditResponseChildren.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$RedditResponseChildrenToJson(this);
}