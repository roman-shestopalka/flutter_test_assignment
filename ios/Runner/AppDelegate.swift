import UIKit
import Flutter
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // Налаштування MethodChannel для взаємодії з Flutter
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.flutter_test_assignment",
                                       binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { [weak self] (call, result) in
      if call.method == "showNotification" {
        if let args = call.arguments as? [String: Any],
           let title = args["title"] as? String,
           let body = args["body"] as? String {
          self?.showNotification(title: title, body: body)
          result("Notification shown")
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid arguments", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func showNotification(title: String, body: String) {
    if #available(iOS 10.0, *) {
      let content = UNMutableNotificationContent()
      content.title = title
      content.body = body
      content.sound = UNNotificationSound.default

      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
      let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
  }
}
