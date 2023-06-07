import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({
    super.key,
    required this.child,
    this.maxInactivityTime = 20000,
  });

  final Widget child;
  final int maxInactivityTime;

  @override
  State<AppLifeCycle> createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  Timer? _screenInactivityTimer;
  DateTime? _pauseTime;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

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
    //TODO: Call push notification
    print('timed out');
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

  void _onAppResumed() {
    _initTimer();
    if (_hasExceededInactivityTime()) {
      _callPushNotification();
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
