import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_posts/repositories/post/reddit/models/reddit_response_data.dart';

part 'reddit_response.g.dart';

@JsonSerializable()
final class RedditResponse {
  final String kind;
  final RedditResponseData data;

  RedditResponse({
    required this.kind,
    required this.data,
  });

  factory RedditResponse.fromJson(Map<String, dynamic> json) =>
      _$RedditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RedditResponseToJson(this);
}
