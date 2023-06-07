import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/repositories/post_repository/reddit/models/reddit_response_data.dart';

part 'reddit_response.g.dart';

@JsonSerializable()
final class RedditResponse {

  RedditResponse({
    required this.kind,
    required this.data,
  });

  factory RedditResponse.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseFromJson(json);
  final String kind;
  final RedditResponseData data;

  Map<String, dynamic> toJson() => _$RedditResponseToJson(this);
}
