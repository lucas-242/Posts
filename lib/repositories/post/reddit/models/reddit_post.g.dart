// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPost _$RedditPostFromJson(Map<String, dynamic> json) => RedditPost(
      kind: json['kind'] as String?,
      data: json['data'] == null
          ? null
          : RedditPostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditPostToJson(RedditPost instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
