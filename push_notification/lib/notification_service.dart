import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  // Local notification plugin instance
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Call this once in main()
  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(initializationSettings);

    // Create Android notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'simple_channel',
      'Simple Notifications',
      importance: Importance.max,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  // Show simple notification
  static Future<void> showSimulatedNotification(
    String title,
    String body,
  ) async {
    await _notificationsPlugin.show(
      DateTime.now().millisecond,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'simple_channel',
          'Simple Notifications',
          priority: Priority.high,
          importance: Importance.max,
        ),
      ),
    );
  }
}
