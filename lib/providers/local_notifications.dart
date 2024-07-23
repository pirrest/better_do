import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'local_notifications.g.dart';

@riverpod
LocalNotificationsService localNotificationsService(
    LocalNotificationsServiceRef ref) {
  return LocalNotificationsService(FlutterLocalNotificationsPlugin());
}

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _plugin;
  late String _timeZone;

  LocalNotificationsService(this._plugin) {
    _init();
  }

  Future<void> _init() async {
    tz.initializeTimeZones();
    _timeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(_timeZone));
    _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');
    final initializationSettingsDarwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );
    await _plugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    const String channelGroupId = 'task_reminder';
    const AndroidNotificationChannelGroup androidNotificationChannelGroup =
        AndroidNotificationChannelGroup(
      channelGroupId,
      "Tasks reminder",
      description: 'Notifications to remind you about your tasks',
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannelGroup(androidNotificationChannelGroup);

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(const AndroidNotificationChannel(
          'main_channel',
          'Main channel',
          description: 'Main channel for tasks reminders',
          groupId: channelGroupId,
          enableLights: true,
          enableVibration: true,
          importance: Importance.high,
          playSound: true,
        ));
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print('notification payload: $payload');
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    print('notification payload: $payload');
  }

  Future<void> scheduleNotification() async {
    await _plugin.zonedSchedule(
      0,
      'scheduled title',
      'scheduled body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
          android: AndroidNotificationDetails('main_channel', 'Main channel',
              channelDescription: 'Main channel for tasks reminders')),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}