// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditResponseData _$RedditResponseDataFromJson(Map<String, dynamic> json) =>
    RedditResponseData(
      after: json['after'] as String?,
      before: json['before'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map(
              (e) => RedditResponseChildren.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RedditResponseDataToJson(RedditResponseData instance) =>
    <String, dynamic>{
      'after': instance.after,
      'before': instance.before,
      'children': instance.children,
    };
