import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    int? scheduledTimeHour,
    int? scheduledTimeMinute,
  }) async {
    print('noti');

    if (scheduledTimeHour != null) {
      tz.initializeTimeZones();
      final String timeZoneName = 'Asia/Ho_Chi_Minh';
      final tz.Location timeZone = tz.getLocation(timeZoneName);
      final DateTime now = DateTime.now();
      final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(
          DateTime(now.year, now.month, now.day, scheduledTimeHour,
              scheduledTimeMinute!, 0),
          timeZone);
      await notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledDateTime,
        await notificationDetails(),
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }
  //
}
