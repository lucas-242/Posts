import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_posts/core/l10n/generated/l10n.dart';
import 'package:reddit_posts/core/models/app_notification.dart';
import 'package:reddit_posts/features/home/cubit/home_cubit.dart';
import 'package:reddit_posts/services/notification_service/notification_service.dart';

class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({
    super.key,
    required this.child,
    this.maxInactivityTime = 20000,
    required this.notificationService,
  });

  final Widget child;
  final int maxInactivityTime;
  final NotificationService notificationService;

  @override
  State<AppLifeCycle> createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  Timer? _screenInactivityTimer;
  DateTime? _pauseTime;
  bool _isNotificationCallback = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.notificationService
        .initialize(notificationCallback: _onNotificationCallback);
    super.initState();
  }

  Future<void> _onNotificationCallback() async {
    _isNotificationCallback = true;
    await _refreshPosts();
  }

  Future<void> _refreshPosts() => context.read<HomeCubit>().onRefresh();

  @override
  void didUpdateWidget(AppLifeCycle oldWidget) {
    _initTimer();
    super.didUpdateWidget(oldWidget);
  }

  void _initTimer() {
    _screenInactivityTimer?.cancel();
    _screenInactivityTimer = Timer(
      Duration(milliseconds: widget.maxInactivityTime),
      _callPushNotification,
    );
  }

  void _callPushNotification() {
    _screenInactivityTimer?.cancel();
    widget.notificationService.showNotification(
      AppNotification(
        title: AppLocalizations.current.inactivityTitle,
        body: AppLocalizations.current.inactivityBody,
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _screenInactivityTimer?.cancel();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        _screenInactivityTimer?.cancel();
        _pauseTime ??= DateTime.now().toUtc();
        return;
      case AppLifecycleState.resumed:
        try {
          _onAppResumed();
        } catch (error) {
          throw Exception('Error on resume app: ${error.toString()}');
        } finally {
          _pauseTime = null;
        }
    }
  }

  Future<void> _onAppResumed() async {
    await _handleNotificationCallback();
    _initTimer();
    _isNotificationCallback = false;
    if (_hasExceededInactivityTime()) {
      _callPushNotification();
    }
  }

  Future<void> _handleNotificationCallback() async {
    if (!_isNotificationCallback) {
      final cubit = context.read<HomeCubit>();

      if (cubit.state is HomeLoadingState) {
        await Future.delayed(const Duration(seconds: 1));
        _handleNotificationCallback();
      }
    }
  }

  bool _hasExceededInactivityTime() {
    final resumedTime = DateTime.now().toUtc();
    final pausedTime = _pauseTime ?? resumedTime;
    final deltaTimeInMilliseconds =
        resumedTime.difference(pausedTime).inMilliseconds;
    return deltaTimeInMilliseconds >= widget.maxInactivityTime;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          _initTimer();
        }
      },
      child: Listener(
        onPointerDown: (_) => _initTimer(),
        onPointerSignal: (_) => _initTimer(),
        child: widget.child,
      ),
    );
  }
}
