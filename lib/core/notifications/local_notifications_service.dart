import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

class LocalNotificationService {
  static final LocalNotificationService _instance =
      LocalNotificationService._();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory LocalNotificationService() => _instance;

  LocalNotificationService._();

  // قائمة الرسائل العشوائية (20 رسالة)
  final List<String> messages = [
    'لا تخَفْ لأنّي معكَ. لا تتَلَفَّتْ لأنّي إلهُكَ. قد أيَّدتُكَ وأعَنتُكَ وعَضَدتُكَ بيَمينِ برّي.',
    'كما كُنتُ مع موسى أكونُ معكَ. لا أُهمِلُكَ ولا أترُكُكَ.',
    'فَتَوَاضَعُوا تَحْتَ يَدِ ٱللَّهِ ٱلْقَدِيرَةِ، لِكَيْ يَرْفَعَكُمْ فِي حِينِهِ',
    'أستَطيعُ كُلَّ شَيءٍ في المَسيحِ الّذي يُقَوّيني.',
    'أنتُمْ قَصَدتُمْ لي شَرًّا، أمّا اللهُ فقَصَدَ بهِ خَيرًا',
    'لا تخَفْ مِنْ وُجوهِهِمْ، لأنّي أنا معكَ لأُنقِذَكَ، يقولُ الرَّبُّ',
    'إذ أسلِحَةُ مُحارَبَتِنا لَيسَتْ جَسَديَّةً، بل قادِرَةٌ باللهِ علَى هَدمِ حُصونٍ.',
    'قُمْ واعمَلْ، وليَكُنِ الرَّبُّ معكَ.',
    'قَائِلًا: إِنِّي لَأُبَارِكَنَّكَ بَرَكَةً وَأُكَثِّرَنَّكَ تَكْثِيرًا. (عبرانيين 6:14)',
    'اِطْلُبُوا أَوَّلًا مَلَكُوتَ ٱللهِ وَبِرَّهُ، وَهَذِهِ كُلُّهَا تُزَادُ لَكُمْ. (متى 6: 33)',
    'إذا صرخ إليّ إني أسمع، لأني رؤوف. (خروج 22: 27)',
    '(متي 34:6) فلا تهتَمّوا للغَدِ، لأنَّ الغَدَ يَهتَمُّ بما لنَفسِهِ. يَكفي اليومَ شَرُّهُ.',
    'وَيَجْعَلُكَ ٱلرَّبُّ رَأْسًا لَا ذَنَبًا، وَتَكُونُ فِي ٱرْتِفَاعٍ فَقَطْ وَلَا تَكُونُ فِي ٱنْحِطَاطٍ، إِذَا سَمِعْتَ لِوَصَايَا ٱلرَّبِّ إِلَهِكَ ٱلَّتِي أَنَا أُوصِيكَ بِهَا ٱلْيَوْمَ لِتَحْفَظَ وَتَعْمَلَ. (تثنية 28: 13)',
    'يَا شَعْبَ صِهْيَوْنَ السَّاكِنَ فِي أُورُشَلِيمَ، لاَ تَبْكِي بُكَاءً. يَتَرَأَّفُ عَلَيْكَ عِنْدَ صَوْتِ صُرَاخِكَ. حِينَمَا يَسْمَعُهُ يُجِيبُكَ. (أشعياء 30: 19)',
    'سَلاَمٌ جَزِيلٌ لِمُحِبِّي شَرِيعَتِكَ، وَلَيْسَ لَهُمْ مَعْثَرَةٌ. (مزمور ١١٩: ١٦٥)',
    'إِذْ أَسْلِحَةُ مُحَارَبَتِنَا لَيْسَتْ جَسَدِيَّةً، بَلْ قَادِرَةٌ بِٱللهِ عَلَى هَدْمِ حُصُونٍ. (2 كورنثوس 10: 4)',
    'إِذَا اجْتَزْتَ فِي الْمِيَاهِ فَأَنَا مَعَكَ، وَفِي الأَنْهَارِ فَلَا تَغْمُرُكَ. إِذَا مَشَيْتَ فِي النَّارِ فَلَا تُلْذَعُ، وَاللَّهِيبُ لَا يُحْرِقُكَ. (إشعياء ٤٣: ٢)',
    'أجعَلُ الظُّلمَةَ أمامَهُمْ نورًا، والمُعوَجّاتِ مُستَقيمَةً. هذِهِ الأُمورُ أفعَلُها ولا أترُكُهُمْ (إشعياء ٤٢: ١٦)',
    'إنْ توانَتْ فانتَظِرها لأنَّها ستأتي إتيانًا ولا تتأخَّرُ. حَبَقُّوق 2:3',
    '... لاَ أَتْرُكُكَ حَتَّى أَفْعَلَ مَا كَلَّمْتُكَ بِهِ. (تكوين ٢٨: ١٥)',
  ];

  // Initialize notification service with proper timezone setup
  Future<void> initialize() async {
    try {
      // Initialize timezone data
      tz.initializeTimeZones();

      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          );

      const InitializationSettings initializationSettings =
          InitializationSettings(android: androidSettings, iOS: iosSettings);

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          if (response.payload != null) {
            print('Notification tapped with payload: ${response.payload}');
          }
        },
      );

      print('LocalNotificationService initialized successfully');
    } catch (e) {
      print('Error initializing LocalNotificationService: $e');
    }
  }

  // Request all required permissions including battery optimization
  Future<bool> requestAllPermissions() async {
    if (Platform.isAndroid) {
      try {
        // Request notification permission
        final notificationStatus = await Permission.notification.request();

        // Request exact alarm permission (Android 12+)
        final alarmStatus = await Permission.scheduleExactAlarm.request();

        // Request to ignore battery optimizations
        final batteryStatus = await Permission.ignoreBatteryOptimizations
            .request();
        print('Battery optimization ignored: ${batteryStatus.isGranted}');

        return notificationStatus.isGranted && alarmStatus.isGranted;
      } catch (e) {
        return false;
      }
    } else if (Platform.isIOS) {
      try {
        final bool? granted = await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >()
            ?.requestPermissions(alert: true, badge: true, sound: true);
        print('iOS notification permission granted: $granted');
        return granted ?? false;
      } catch (e) {
        print('Error requesting iOS permissions: $e');
        return false;
      }
    }
    return true;
  }

  // Check if exact alarms are allowed
  Future<bool> canScheduleExactAlarms() async {
    if (Platform.isAndroid) {
      try {
        final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
            _flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin
                >();
        return await androidImplementation?.canScheduleExactNotifications() ??
            false;
      } catch (e) {
        print('Error checking exact alarm permission: $e');
        return false;
      }
    }
    return true;
  }

  // Schedule multiple daily notifications at exactly 8:00 AM
  Future<void> scheduleMultipleDailyNotifications() async {
    try {
      // Cancel existing notifications first
      await cancelAllNotifications();

      print('Scheduling notifications for the next 30 days at 8:00 AM');
      final random = Random();
      final now = DateTime.now();

      for (int i = 0; i < 30; i++) {
        final scheduledDate = now.add(Duration(days: i));
        var scheduledTime = DateTime(
          scheduledDate.year,
          scheduledDate.month,
          scheduledDate.day,
          8, // ساعة 8 صباحاً
          0, // دقيقة 0
          0, // ثانية 0
        );

        // إذا كان اليوم الأول والوقت فات 8 صباحاً، جدول للغد
        if (i == 0 && now.isAfter(scheduledTime)) {
          scheduledTime = scheduledTime.add(const Duration(days: 1));
          continue;
        }

        final randomMessage = messages[random.nextInt(messages.length)];
        final notificationId = 2000 + i; // Unique ID for each day

        // إعدادات Android مع إعداد BigText لعرض النص كاملاً
        final AndroidNotificationDetails androidDetails =
            AndroidNotificationDetails(
              'daily_message_channel',
              'Daily Messages',
              channelDescription: 'Daily motivational messages',
              importance: Importance.max,
              priority: Priority.high,
              showWhen: true,
              enableVibration: true,
              playSound: true,
              fullScreenIntent: true,
              category: AndroidNotificationCategory.reminder,
              // إعدادات خاصة لعرض النص الطويل كاملاً
              styleInformation: BigTextStyleInformation(
                randomMessage,
                htmlFormatBigText: true,
                contentTitle: 'رسالة اليوم 💡',
                htmlFormatContentTitle: true,
                summaryText: 'اضغط لقراءة الرسالة كاملة',
                htmlFormatSummaryText: true,
              ),
              // إعدادات إضافية لضمان الظهور
              autoCancel: false,
              ongoing: false,
              onlyAlertOnce: false,
            );

        const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          // إعدادات iOS لعرض النص كاملاً
          subtitle: 'رسالة يومية',
        );

        final NotificationDetails platformDetails = NotificationDetails(
          android: androidDetails,
          iOS: iosDetails,
        );

        // Check if exact alarms are allowed
        final canScheduleExact = await canScheduleExactAlarms();

        try {
          if (canScheduleExact) {
            await _flutterLocalNotificationsPlugin.zonedSchedule(
              notificationId,
              'رسالة اليوم 💡',
              randomMessage,
              tz.TZDateTime.from(scheduledTime, tz.local),
              platformDetails,
              payload: 'daily_message_$i',
              androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            );
          } else {
            await _flutterLocalNotificationsPlugin.zonedSchedule(
              notificationId,
              'رسالة اليوم 💡',
              randomMessage,
              tz.TZDateTime.from(scheduledTime, tz.local),
              platformDetails,
              payload: 'daily_message_$i',
              androidScheduleMode: AndroidScheduleMode.inexact,
            );
          }

          print(
            '✅ Notification scheduled for ${scheduledTime.toString().substring(0, 16)} (Day ${i + 1})',
          );
        } catch (e) {
          print('❌ Error scheduling notification for day ${i + 1}: $e');
        }
      }

      print('✅ All daily notifications scheduled successfully for 8:00 AM');
    } catch (e) {
      print('❌ Error scheduling multiple daily notifications: $e');
    }
  }

  // Show immediate notification with BigText style
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    String channelId = 'daily_message_channel',
    String channelName = 'Daily Messages',
    String channelDescription = 'Daily motivational messages',
  }) async {
    try {
      print('Attempting to show notification: $title');

      final AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            channelId,
            channelName,
            channelDescription: channelDescription,
            importance: Importance.max,
            priority: Priority.high,
            showWhen: true,
            enableVibration: true,
            playSound: true,
            // إعدادات لعرض النص الطويل كاملاً
            styleInformation: BigTextStyleInformation(
              body,
              htmlFormatBigText: true,
              contentTitle: title,
              htmlFormatContentTitle: true,
              summaryText: 'اضغط لقراءة الرسالة كاملة',
              htmlFormatSummaryText: true,
            ),
          );

      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      final NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        platformDetails,
        payload: payload,
      );

      print('✅ Notification shown successfully with ID: $id');
    } catch (e) {
      print('❌ Error showing notification: $e');
    }
  }

  // Cancel specific notification
  Future<void> cancelNotification(int id) async {
    try {
      await _flutterLocalNotificationsPlugin.cancel(id);
      print('Notification cancelled with ID: $id');
    } catch (e) {
      print('Error cancelling notification: $e');
    }
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    try {
      await _flutterLocalNotificationsPlugin.cancelAll();
      print('All notifications cancelled');
    } catch (e) {
      print('Error cancelling all notifications: $e');
    }
  }

  // Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    try {
      final pending = await _flutterLocalNotificationsPlugin
          .pendingNotificationRequests();
      for (var notification in pending) {
        print(
          '📋 Pending: ID ${notification.id}, Title: ${notification.title}',
        );
      }
      return pending;
    } catch (e) {
      print('Error getting pending notifications: $e');
      return [];
    }
  }

  // Debug function to check all settings
  Future<void> debugNotificationSettings() async {
    try {
      print('=== 🔍 Notification Debug Info ===');

      // Check permissions
      final notificationPermission = await Permission.notification.status;
      final exactAlarmPermission = await Permission.scheduleExactAlarm.status;
      final batteryOptimization =
          await Permission.ignoreBatteryOptimizations.status;

      print('📱 Notification permission: $notificationPermission');
      print('⏰ Exact alarm permission: $exactAlarmPermission');
      print('🔋 Battery optimization ignored: $batteryOptimization');

      // Check if exact alarms can be scheduled
      final canScheduleExact = await canScheduleExactAlarms();
      print('✅ Can schedule exact notifications: $canScheduleExact');

      // Get pending notifications
      final pending = await getPendingNotifications();
      print('📊 Total pending notifications: ${pending.length}');

      // Show next notification time
      if (pending.isNotEmpty) {
        final now = DateTime.now();
        final tomorrow8AM = DateTime(now.year, now.month, now.day + 1, 8, 0);
        print(
          '⏰ Next notification scheduled for: ${tomorrow8AM.toString().substring(0, 16)}',
        );
      }

      print('=== End Debug Info ===');
    } catch (e) {
      print('❌ Error in debug function: $e');
    }
  }

  // Verify that notifications are set for 8 AM
  Future<void> verifyScheduledTimes() async {
    try {
      final pending = await getPendingNotifications();
      print('🔍 Verifying scheduled notification times:');

      final now = DateTime.now();
      for (int i = 0; i < 5 && i < pending.length; i++) {
        final expectedTime = DateTime(
          now.year,
          now.month,
          now.day + i + (now.hour >= 8 ? 1 : 0),
          8,
          0,
        );
        print(
          '📅 Day ${i + 1}: Expected at ${expectedTime.toString().substring(0, 16)}',
        );
      }
    } catch (e) {
      print('❌ Error verifying scheduled times: $e');
    }
  }
}
