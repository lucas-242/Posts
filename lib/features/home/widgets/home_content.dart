import 'package:flutter/material.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/home/home.dart';
import 'package:reddit_posts/features/home/widgets/post_list.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final localPosts = state.posts.where((p) => p.isLocal).toList();
    final onlinePosts = state.posts.where((p) => !p.isLocal).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: localPosts.isNotEmpty,
          child: Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PostList(
                    title: AppLocalizations.current.myPosts,
                    posts: localPosts,
                  ),
                ),
                AppSizeConstants.largeVerticalSpacer,
              ],
            ),
          ),
        ),
        Expanded(
          child: PostList(
            title: AppLocalizations.current.listsOfPosts,
            posts: onlinePosts,
          ),
        ),
      ],
    );
  }
}
