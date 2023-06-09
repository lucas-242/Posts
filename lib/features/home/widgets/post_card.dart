import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reddit_posts/core/extensions/extensions.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/models/enums.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/features/app_cubit.dart';
import 'package:reddit_posts/features/home/home.dart';
import 'package:reddit_posts/features/post/cubit/post_form_cubit.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    void onTapEdit() {
      context.read<AppCubit>().changePage(AppPage.addPost);
      context.read<PostFormCubit>().onChangePost(post);
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizeConstants.largeSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    post.title,
                    style: context.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
                Visibility(
                  visible: post.isLocal,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: onTapEdit,
                        icon: const Icon(Icons.edit),
                      ),
                      AppSizeConstants.smallHorizontalSpacer,
                      IconButton(
                        onPressed: () =>
                            context.read<HomeCubit>().delete(post.id),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                )
              ],
            ),
            AppSizeConstants.mediumVerticalSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: '${AppLocalizations.current.by}: ',
                      style: context.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: post.author,
                          style: context.bodyMedium!
                              .copyWith(color: context.colorsScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    DateFormat.yMd()
                        .add_Hm()
                        .format(post.created)
                        .normalizeDate(),
                  ),
                ),
              ],
            ),
            AppSizeConstants.mediumVerticalSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.current.upvotes,
                    style: context.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: ' ${post.ups}',
                        style: context.bodyMedium!
                            .copyWith(color: context.colorsScheme.primary),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.current.comments,
                    style: context.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: ' ${post.commentsQuantity}',
                        style: context.bodyMedium!
                            .copyWith(color: context.colorsScheme.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
