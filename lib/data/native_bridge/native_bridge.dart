import 'package:flutter/services.dart';

class NativeBridge {
  static const MethodChannel _channel =
      MethodChannel('com.example.flutter_test_assignment');

  static Future<String> getFloorsStatus() async {
    try {
      final String showNotification =
          await _channel.invokeMethod('showNotification');
      return showNotification;
    } on PlatformException catch (e) {
      return "Failed to get floor status: ${e.message}.";
    }
  }
}
