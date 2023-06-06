import 'package:json_annotation/json_annotation.dart';

part 'reddit_post_data.g.dart';

@JsonSerializable()
final class RedditPostData {
  final String authorFullname;
  final String title;
  final int ups;
  final int created;
  final int createdUtc;
  @JsonKey(name: 'num_comments')
  final int numComments;

  RedditPostData({
    required this.authorFullname,
    required this.numComments,
    required this.title,
    required this.ups,
    required this.created,
    required this.createdUtc,
  });
}
