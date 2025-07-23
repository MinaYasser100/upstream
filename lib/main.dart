import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/notifications/local_notifications_service.dart';
import 'package:upstream/core/routing/app_router.dart';
import 'package:upstream/core/utils/theme_data_func.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize ScreenUtil
    await ScreenUtil.ensureScreenSize();

    // Initialize LocalNotificationService
    final notificationService = LocalNotificationService();
    await notificationService.initialize();

    // Request all required permissions
    final permissionsGranted = await notificationService
        .requestAllPermissions();
    print('✅ All permissions granted: $permissionsGranted');

    // Debug notification settings
    await notificationService.debugNotificationSettings();

    if (permissionsGranted) {
      // Schedule notifications for the next 30 days at exactly 8:00 AM
      await notificationService.scheduleMultipleDailyNotifications();

      // Verify that notifications are scheduled correctly for 8 AM
      await notificationService.verifyScheduledTimes();

      // Check pending notifications
      final pending = await notificationService.getPendingNotifications();
      print(
        '✅ Successfully scheduled ${pending.length} daily notifications for 8:00 AM',
      );
    } else {
      print('❌ Permissions not granted, cannot schedule notifications');
      print(
        '📱 Please enable notifications and exact alarms in device settings',
      );
    }

    print('🚀 App initialization completed successfully');

    // Run the app
    runApp(const MyApp());
  } catch (e, stackTrace) {
    print('❌ Error during app initialization: $e');
    print('📋 Stack trace: $stackTrace');
    // Run app with error handling
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 64, color: Colors.red),
                SizedBox(height: 16),
                Text('App initialization failed'),
                SizedBox(height: 8),
                Text('$e', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeDataFunc(),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
