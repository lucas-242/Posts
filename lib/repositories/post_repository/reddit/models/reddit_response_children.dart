import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/repositories/post_repository/reddit/models/reddit_post.dart';

part 'reddit_response_children.g.dart';

@JsonSerializable()
final class RedditResponseChildren {

  RedditResponseChildren({
    required this.kind,
    required this.data,
  });

  factory RedditResponseChildren.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseChildrenFromJson(json);
  final String kind;
  final RedditPost data;

  Map<String, dynamic> toJson() => _$RedditResponseChildrenToJson(this);
}
