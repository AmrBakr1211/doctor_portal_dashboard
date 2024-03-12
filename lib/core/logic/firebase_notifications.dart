// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../firebase_options.dart';
// import '../../generated/locale_keys.g.dart';
// import 'helper_methods.dart';
//
// //todo: add sha256 and apns for ios
//
// @pragma('vm:entry-point')
// // final refreshTokenBloc = KiwiContainer().resolve<RefreshTokenBloc>();
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   AwesomeNotifications().getInitialNotificationAction().asStream().listen((event) {
//     AppNotifications().notifyNow(
//       title: message.data["title"],
//       body: message.data["body"],
//       notifyType: message.data["notify_type"],
//     );
//   });
//
//   AwesomeNotifications().createNotificationFromJsonData(message.data);
// }
//
// class AppNotifications {
//   late String token;
//
//   Future<String> getFCMToken() async {
//     token =
//
//         // ignore: body_might_complete_normally_catch_error
//         await FirebaseMessaging.instance.getToken().catchError((err) {
//               debugPrint(err.toString());
//             }) ??
//             "";
//     print("${"-" * 30}>\n$token");
//     return token;
//   }
//
//   Future<void> setupTokenRefreshListener() async {
//     FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
//       token = newToken;
//       // refreshTokenBloc.add(SendRefreshTokenEvent(refreshToken: token));
//       debugPrint("&&&&&&&&&$token&&&&&&&&&&&&&");
//     });
//   }
//
//   Future<void> getScheduled() async {
//     final list = await AwesomeNotifications().listScheduledNotifications();
//     for (var element in list) {
//       if (kDebugMode) {
//         print(element.schedule!.timeZone);
//       }
//       if (kDebugMode) {
//         print(element.toMap());
//       }
//     }
//   }
//
//   Future<void> init() async {
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     var permission = await Permission.notification.request();
//     if (kDebugMode) {
//       print(permission);
//     }
//     if (permission.isDenied) {
//       await showPermissions(
//           onPressed: () async {
//             await openAppSettings();
//           },
//           content: LocaleKeys.allowAppToSendNotifications.tr());
//       return;
//     } else {
//       await getFCMToken();
//       await setupTokenRefreshListener();
//       AwesomeNotifications().initialize('resource://drawable/ic_notify', [
//         NotificationChannel(
//           channelKey: "my_channel",
//           channelName: "My Channel",
//           channelShowBadge: true,
//           channelDescription: "My Channel Description",
//           importance: NotificationImportance.High,
//         ),
//         NotificationChannel(
//           channelKey: "time_select_time",
//           channelName: "Time Select Time",
//           channelDescription: "My Channel Description",
//           importance: NotificationImportance.High,
//         ),
//       ]);
//       AwesomeNotifications().getInitialNotificationAction();
//       listen();
//     }
//   }
//
//   void listen({Widget? page}) {
//     AwesomeNotifications().isNotificationAllowed().then((value) {
//       if (value) {
//         if (kDebugMode) {
//           print("hello " * 30);
//         }
//         FirebaseMessaging.onMessage.listen((event) {
//           debugPrint("onMessage");
//           // debugPrint(event.notification!.body);
//           // debugPrint(event.notification!.android!.channelId);
//           notifyNow(
//             channelId: "my_channel",
//             title: event.data["title"],
//             body: event.data["body"],
//             notifyType: event.data["notify_type"],
//           );
//         });
//         FirebaseMessaging.onMessageOpenedApp.listen((event) {
//           debugPrint("onMessageOpenedApp");
//           debugPrint(event.data.toString());
//           notifyNow(
//             channelId: "my_channel",
//             title: event.data["title"],
//             body: event.data["body"],
//             notifyType: event.data["notify_type"],
//           );
//         });
//
//         AwesomeNotifications().setListeners(
//           onActionReceivedMethod: NotificationController.onActionReceivedMethod,
//           onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
//           onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
//           onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
//         );
//         debugPrint("Permission Allowed");
//       } else {
//         debugPrint("No Permissions taken");
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//   }
//
//   void close() {
//     // AwesomeNotifications().actionSink.close();
//   }
//
//   void notifyNow({String? channelId, String? title, String? body, String? image, String? notifyType}) {
//     AwesomeNotifications()
//         .createNotification(
//       content: NotificationContent(
//         id: 20,
//         channelKey: channelId ?? "my_channel",
//         body: body ?? "",
//         title: title ?? "",
//       ),
//     )
//         .catchError((ex) {
//       print(ex);
//     });
//   }
//
//   void notifyAtSpecificTime({hour, minute, title, body}) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(id: 33, channelKey: "time_select_time", title: title, body: body),
//       schedule: NotificationCalendar(hour: hour, minute: minute),
//     );
//   }
//
//   Future<void> cancelAllScheduledNotifications() async {
//     await AwesomeNotifications().cancelAllSchedules();
//   }
// }
//
// class NotificationController {
//   /// Use this method to detect when a new notification or a schedule is created
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
//     debugPrint("onNotificationCreatedMethod${"*" * 30}");
//     debugPrint(receivedNotification.body);
//   }
//
//   /// Use this method to detect every time that a new notification is displayed
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
//     debugPrint("onNotificationDisplayedMethod${"*" * 30}");
//     debugPrint(receivedNotification.body);
//     AppNotifications().notifyNow();
//   }
//
//   /// Use this method to detect if the user dismissed a notification
//   @pragma("vm:entry-point")
//   static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
//     debugPrint("onDismissActionReceivedMethod${"*" * 30}");
//     debugPrint(receivedAction.body);
//   }
//
//   /// Use this method to detect when the user taps on a notification or action button
//   @pragma("vm:entry-point")
//   static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
//     // Your code goes here
//     debugPrint("onActionReceivedMethod${"*" * 30}");
//     debugPrint("--------------------------------");
//     receivedAction.body;
//
//     // // Navigate into pages, avoiding to open the notification details page over another details page already opened
//     // navigateTo(const HomeNavView(
//     //   currentPage: 1,
//     // ));
//     // navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
//     //         (route) => (route.settings.name != '/notification-page') || route.isFirst,
//     //     arguments: receivedAction);
//   }
// }
//
// Future showPermissions({required String content, required void Function()? onPressed}) async {
//   await showModalBottomSheet(
//     builder: (context) => Column(
//       children: [
//         SizedBox(
//           height: 16.h,
//         ),
//         Text(
//           content,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 20.sp,
//             fontWeight: FontWeight.w700,
//             color: Theme.of(navigatorKey.currentContext!).primaryColor,
//           ),
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         TextButton(
//           onPressed: onPressed,
//           child: Text(
//             LocaleKeys.accept.tr(),
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 16.h,
//         ),
//         const Divider(),
//         TextButton(
//           onPressed: () {
//             Navigator.pop(navigatorKey.currentContext!);
//           },
//           style: TextButton.styleFrom(
//             foregroundColor: Theme.of(navigatorKey.currentContext!).colorScheme.error,
//           ),
//           child: Text(
//             LocaleKeys.cancel.tr(),
//             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//           ),
//         ),
//       ],
//     ),
//     context: navigatorKey.currentContext!,
//   );
// }
