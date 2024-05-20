import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/app/flutter_test_assignment_app.dart';
import 'package:flutter_test_assignment/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService = NotificationService();
  await notificationService.initNotifications();

  runApp(const FlutterTestAssignmentApp());
}
