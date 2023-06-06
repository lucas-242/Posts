import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/models/enums.dart';
import 'package:reddit_posts/core/widgets/custom_bottom_navigation/custom_bottom_navigation.dart';
import 'package:reddit_posts/features/home/pages/home_page.dart';
import 'package:reddit_posts/features/profile/pages/profile_page.dart';

import 'app_cubit.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    Key? key,
  }) : super(key: key);

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();

    return Scaffold(
      body: _getScreen(),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomBottomNavigation(
        currentPage: context.watch<AppCubit>().state.page.index,
        onTap: (index) => cubit.changePage(AppPage.fromIndex(index)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomCenter,
      //   heightFactor: 1.5,
      //   child: DecoratedBox(
      //     decoration: BoxDecoration(
      //       border: Border.all(color: Colors.white, width: 4),
      //       shape: BoxShape.circle,
      //     ),
      //     child: FloatingActionButton(
      //       onPressed: _onTapFloatingActionButton,
      //       tooltip: AppLocalizations.current.newService,
      //       child: Icon(cubit.isAddServicePage ? Icons.close : Icons.add),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _getScreen() {
    final page = context.read<AppCubit>().state.page;
    switch (page) {
      case AppPage.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
