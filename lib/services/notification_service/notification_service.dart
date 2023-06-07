import 'package:reddit_posts/core/models/app_notification.dart';

abstract interface class NotificationService {
  void initialize({Function? notificationCallback});
  void showNotification(AppNotification notification);
}
