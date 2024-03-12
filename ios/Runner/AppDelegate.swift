import UIKit
import Flutter
// import flutter_local_notifications
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure();
//       FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
//           GeneratedPluginRegistrant.register(with: registry)
//       }
      if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
      }
      let controller = window.rootViewController as! FlutterViewController
      let flavorChannel = FlutterMethodChannel(
          name: "flavor",
          binaryMessenger: controller.binaryMessenger)
      flavorChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          let flavor = Bundle.main.infoDictionary?["App - Flavor"]
          result(flavor)
      })
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
