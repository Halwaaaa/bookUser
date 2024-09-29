import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ServersEmail {
  void sendEmail() async {
    String username = 'halwadev@gmail.com'; // بريدك الإلكتروني
    String password = 'laith*070#'; // كلمة المرور الخاصة ببريدك الإلكتروني

    final smtpServer = gmail(username, password);

    // إعداد رسالة البريد الإلكتروني
    final message = Message()
      ..from = Address(username, 'Your Name')
      ..recipients.add('laith5102000@gmail.com') // المستلم
      ..subject = 'Test Flutter Email' // عنوان البريد الإلكتروني
      ..text = 'This is the body of the email.'; // محتوى البريد (نص)

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent. $e');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
