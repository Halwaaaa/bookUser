import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:user/featuers/Drawer/persenation/view/clock/clock.dart';
// flutterLocalNotificationsPlugin.initialize(
//     InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//     ),
//     onSelectNotification: (payload) async {
//       if (payload != null) {
//         // Navigate to the specified page
//         Navigator.pushNamed(context, payload);
//       }

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Function(NotificationResponse)? push) async {
    var androidInitialize =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    // var iOSInitialize = new IOSInitializationSettings();
    var initializationsSettings = InitializationSettings(
      android: androidInitialize,

      // iOS: iOSInitialize
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: push,
    );
  }

  NotificationDetails not() {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      channelDescription: 'channelDescription:',

      // timeoutAfter: 5000,

      playSound: true,

      // sound: //UriAndroidNotificationSound("images/noticfa.mp3"),
      // RawResourceAndroidNotificationSound('noticfa'),
      importance: Importance.max,
      priority: Priority.high,
    );
    return NotificationDetails(
      android: androidPlatformChannelSpecifics,
      //iOS: IOSNotificationDetails()
    );
  }

  Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
  }) async {
    // await fln.zonedSchedule(id, title, body, tz.TZDateTime.now(tz.local), not,
    //     uiLocalNotificationDateInterpretation:
    //         UILocalNotificationDateInterpretation.wallClockTime);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      not(),
      payload: "test",
    );
  }

  Future scheduleNotification(
      {int id = 0,
      tz.TZDateTime? scheduledDate,
      String? title,
      String? boby,
      String? payLoad,
      required tz.TZDateTime sca}) async {
    flutterLocalNotificationsPlugin.zonedSchedule(
        id, "kkk", "000", scheduledDate!, not(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime);

    // return flutterLocalNotificationsPlugin.periodicallyShow(
    //     id, ".,,,", "llll", RepeatInterval.everyMinute, not(),
    //     androidAllowWhileIdle: true);
  }

  void test() {
    print("lll");
    flutterLocalNotificationsPlugin.periodicallyShow(
        1, "xxxxxxxx", "x", RepeatInterval.everyMinute, not());
  }
  //   return flutterLocalNotificationsPlugin
  //       .zonedSchedule(id, title, boby, sca, await not(),
  //           // ignore: deprecated_member_use
  //           androidAllowWhileIdle: true,
  //           uiLocalNotificationDateInterpretation:
  //               UILocalNotificationDateInterpretation.wallClockTime)
  //       .then((value) {
  //     Noti().showBigTextNotification(title: ";lkjh", body: "");
  //   });
  // }
}
