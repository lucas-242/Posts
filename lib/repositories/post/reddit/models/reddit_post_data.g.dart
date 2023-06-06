// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPostData _$RedditPostDataFromJson(Map<String, dynamic> json) =>
    RedditPostData(
      authorFullname: json['authorFullname'] as String,
      numComments: json['num_comments'] as int,
      title: json['title'] as String,
      ups: json['ups'] as int,
      created: json['created'] as int,
      createdUtc: json['createdUtc'] as int,
    );

Map<String, dynamic> _$RedditPostDataToJson(RedditPostData instance) =>
    <String, dynamic>{
      'authorFullname': instance.authorFullname,
      'title': instance.title,
      'ups': instance.ups,
      'created': instance.created,
      'createdUtc': instance.createdUtc,
      'num_comments': instance.numComments,
    };
