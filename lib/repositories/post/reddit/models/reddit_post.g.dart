// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPost _$RedditPostFromJson(Map<String, dynamic> json) => RedditPost(
      author: json['author'] as String?,
      numComments: json['num_comments'] as int?,
      title: json['title'] as String?,
      ups: json['ups'] as int?,
      created: (json['created'] as num?)?.toDouble(),
      createdUtc: (json['createdUtc'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RedditPostToJson(RedditPost instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'ups': instance.ups,
      'created': instance.created,
      'createdUtc': instance.createdUtc,
      'num_comments': instance.numComments,
    };
