import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/models/enums.dart';
import 'package:reddit_posts/core/models/post.dart';
import 'package:reddit_posts/core/widgets/custom_safe_area/custom_safe_area.dart';
import 'package:reddit_posts/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:reddit_posts/core/widgets/loading/loading.dart';
import 'package:reddit_posts/features/app_cubit.dart';
import 'package:reddit_posts/features/post/cubit/post_form_cubit.dart';
import 'package:reddit_posts/features/post/widgets/post_form_content.dart';

class PostFormPage extends StatefulWidget {
  const PostFormPage({super.key, this.post});

  final Post? post;

  @override
  State<PostFormPage> createState() => _PostFormPageState();
}

class _PostFormPageState extends State<PostFormPage> {
  bool isCreating(Post? post) => post == null || post.id == -1;

  void onConfirm(Post post) {
    if (isCreating(post)) {
      context.read<PostFormCubit>().addPost();
    } else {
      context.read<PostFormCubit>().updatePost();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: SingleChildScrollView(
        child: BlocListener<PostFormCubit, PostFormState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is PostFormSuccessState) {
              context.read<AppCubit>().changePage(AppPage.home);
            } else if (state is PostFormErrorState) {
              getCustomSnackBar(
                context,
                message: state.error!,
              );
            }
          },
          child: BlocBuilder<PostFormCubit, PostFormState>(
            builder: (context, state) {
              if (state is PostFormLoadingState) {
                return const Loading();
              }

              return PostFormContent(
                onConfirm: () => onConfirm(state.post),
              );
            },
          ),
        ),
      ),
    );
  }
}
