// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditResponse _$RedditResponseFromJson(Map<String, dynamic> json) =>
    RedditResponse(
      kind: json['kind'] as String,
      data: RedditResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditResponseToJson(RedditResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
