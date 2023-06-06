import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/themes/themes.dart';
import 'package:reddit_posts/core/widgets/custom_safe_area/custom_safe_area.dart';
import 'package:reddit_posts/core/widgets/custom_snack_bar/custom_snack_bar.dart';
import 'package:reddit_posts/core/widgets/loading/loading.dart';
import 'package:reddit_posts/features/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final cubit = context.read<HomeCubit>();
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      onRefresh: () => context.read<HomeCubit>().onRefresh(),
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is HomeErrorState) {
            getCustomSnackBar(
              context,
              message: state.error ?? '',
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Loading();
            }

            if (state is HomeErrorState) {
              return Center(
                  child: Text(
                AppLocalizations.current.errorToLoadData,
                style: context.titleMedium,
              ));
            }

            return HomeContent(state: state);
          },
        ),
      ),
    );
  }
}
