import 'package:flutter/material.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/home/widgets/post_card.dart';

class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required this.title,
    required this.posts,
  });

  final String title;
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.titleMedium),
        AppSizeConstants.largeVerticalSpacer,
        Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostCard(post: post);
            },
          ),
        ),
      ],
    );
  }
}
