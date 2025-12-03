import 'package:flutter/material.dart';
import 'package:push_notification/notification_service.dart';

class PracticeNotificationPage extends StatefulWidget {
  const PracticeNotificationPage({super.key});

  @override
  State<PracticeNotificationPage> createState() =>
      _PracticeNotificationPageState();
}

class _PracticeNotificationPageState extends State<PracticeNotificationPage> {
  int counter = 0;
  bool toggle = false;

  void _simple() {
    NotificationService.showSimulatedNotification(
      'Simple Notification',
      'This is a basic test message.',
    );
  }

  void _doubleTap() {
    NotificationService.showSimulatedNotification(
      'Double Tap',
      'You triggered a double-tap notification!',
    );
  }

  void _longPress() {
    NotificationService.showSimulatedNotification(
      'Long Press',
      'Long press detected successfully.',
    );
  }

  void _counterIncrement() {
    setState(() => counter++);
    if (counter == 5) {
      NotificationService.showSimulatedNotification(
        'Counter Reached!',
        'Counter value has reached 5.',
      );
    }
  }

  void _toggleSwitch(bool value) {
    setState(() => toggle = value);
    NotificationService.showSimulatedNotification(
      'Switch Toggled',
      value ? 'Switch turned ON.' : 'Switch turned OFF.',
    );
  }

  void _fakeApiSuccess() async {
    await Future.delayed(const Duration(seconds: 2));
    NotificationService.showSimulatedNotification(
      'API Success',
      'Fake API responded successfully!',
    );
  }

  void _fakeApiError() async {
    await Future.delayed(const Duration(seconds: 2));
    NotificationService.showSimulatedNotification(
      'API Error',
      'Something went wrong! (Fake API)',
    );
  }

  void _timedNotification() {
    Future.delayed(const Duration(seconds: 3), () {
      NotificationService.showSimulatedNotification(
        'Timer Finished',
        '3 seconds completed.',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Practice')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: _simple,
              child: const Text('Simple Notification'),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onDoubleTap: _doubleTap,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Double Tap Here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onLongPress: _longPress,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Long Press Here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _counterIncrement,
              child: Text('Increase Counter (Current: $counter)'),
            ),
            const SizedBox(height: 16),

            SwitchListTile(
              title: const Text('Toggle Switch'),
              value: toggle,
              onChanged: _toggleSwitch,
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _fakeApiSuccess,
              child: const Text('Fake API Success'),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _fakeApiError,
              child: const Text('Fake API Error'),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _timedNotification,
              child: const Text('Timer (3 sec) Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
