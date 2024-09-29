import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.userCredential});
  final UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 5)).asyncMap((_) async {
        await userCredential.user?.reload();
        print(userCredential.user?.emailVerified); // إعادة تحميل حالة المستخدم
        return userCredential.user;
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(
                  child:
                      CircularProgressIndicator())); // عرض مؤقت أثناء الانتظار
        } else if (snapshot.hasData) {
          var user = snapshot.data;
          print(user?.emailVerified); // طباعة حالة التحقق من البريد
          print(user?.email);
          // طباعة البريد الإلكتروني للمستخدم

          if (user?.emailVerified == !true) {
            return const Center(child: Text('Email is verified!'));
          } else {
            return Scaffold(
                body: Center(
                    child: InkWell(
                        onTap: () {
                          userCredential.user?.reload().then((value) {
                            print(userCredential.user?.emailVerified);
                          });
                        },
                        child: const Text('Email is not verified yet.'))));
          }
        } else {
          return const Center(child: Text('No user data'));
        }
      },
    );
  }
}
