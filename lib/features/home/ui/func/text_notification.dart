import 'dart:math';

import 'package:flutter/material.dart';
import 'package:upstream/core/notifications/local_notifications_service.dart';

class TestNotification extends StatelessWidget {
  final LocalNotificationService notificationService;

  const TestNotification({super.key, required this.notificationService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Agricultural Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome! Daily notifications are scheduled at 8 AM.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Select a random message from the notification service's messages
                final random = Random();
                final messages = notificationService.messages;
                final randomMessage = messages[random.nextInt(messages.length)];
                // Show immediate notification
                await notificationService.showNotification(
                  id: DateTime.now().millisecondsSinceEpoch ~/ 1000 % 10000,
                  title: 'رسالة اليوم',
                  body: randomMessage,
                  payload: 'daily_message',
                );
              },
              child: const Text('Test Notification Now'),
            ),
          ],
        ),
      ),
    );
  }
}
