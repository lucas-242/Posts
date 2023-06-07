// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_response_children.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditResponseChildren _$RedditResponseChildrenFromJson(
        Map<String, dynamic> json) =>
    RedditResponseChildren(
      kind: json['kind'] as String,
      data: RedditPost.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditResponseChildrenToJson(
        RedditResponseChildren instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
