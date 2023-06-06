import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/widgets/custom_bottom_navigation/custom_bottom_navigation.dart';

import 'app_cubit.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    Key? key,
  }) : super(key: key);

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late StreamSubscription<bool> userStream;

  @override
  void initState() {
    context.read<AppCubit>().changePage(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();

    return BlocBuilder<AppCubit, int>(
      builder: (context, state) {
        return Scaffold(
          // appBar: const CustomAppBar(),
          body: _getScreen(),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: CustomBottomNavigation(
            currentPage: context.watch<AppCubit>().state,
            onTap: (index) => cubit.changePage(index),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
      },
    );
  }

  Widget _getScreen() {
    final index = context.read<AppCubit>().state;
    switch (index) {
      case 0:
        return Container(color: Colors.green);
      case 1:
        return Container(color: Colors.blue);
      default:
        return Container(color: Colors.red);
    }
  }
}
