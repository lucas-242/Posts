import 'package:flutter/material.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/home/home.dart';
import 'package:reddit_posts/features/home/widgets/post_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppLocalizations.current.listsOfPosts, style: context.titleMedium),
        AppSizeConstants.largeVerticalSpacer,
        Expanded(
          child: ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return PostCard(post: post);
            },
          ),
        )
      ],
    );
  }
}
