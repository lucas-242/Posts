import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reddit_posts/core/models/app_notification.dart';
import 'package:reddit_posts/services/notification_service/notification_service.dart';

final class LocalNotificationService implements NotificationService {
  final _notificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationDetails get _notificationDetails => const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName'),
      );

  final _initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'));

  @override
  Future<void> initialize({Function? notificationCallback}) async =>
      _notificationsPlugin.initialize(
        _initializationSettings,
        onDidReceiveNotificationResponse: (_) =>
            notificationCallback != null ? notificationCallback() : null,
      );

  @override
  Future<void> showNotification(AppNotification notification) =>
      _notificationsPlugin.show(
        notification.id,
        notification.title,
        notification.body,
        _notificationDetails,
      );
}
