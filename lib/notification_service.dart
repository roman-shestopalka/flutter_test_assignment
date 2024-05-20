import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("flutter_logo");

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSetting,
        onDidReceiveBackgroundNotificationResponse: backgroundHandler);
  }

  static void backgroundHandler(
      NotificationResponse notificationResponse) async {}

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'id',
          'body',
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        0, title, body, await notificationDetails());
  }
}
