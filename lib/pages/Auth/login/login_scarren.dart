// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:user/shard/commponted/Dafult/DafultBoutton.dart';
import 'package:user/shard/commponted/Dafult/DafultTextFormFiled.dart';
import 'package:user/shard/constant/methed.dart';
import 'package:user/shard/cubit/AuthSin/AuthLogin/CubitLogin.dart';
import 'package:user/shard/cubit/AuthSin/AuthLogin/StateLogin.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider<AppCubitLogin>(
      create: (context) => AppCubitLogin(),
      child: BlocConsumer<AppCubitLogin, AppStateLogin>(
        listener: (context, state) {
          // if (state is DoctorLoginSucssesState) {
          //   // CacheHelper.saveData(key: 'uid', value: state.uid);

          //   // navigateAndFinish(context, const navbairRoot());
          // }
        },
        builder: (context, state) {
          final double wdith = MediaQuery.sizeOf(context).width;
          final double hight = MediaQuery.sizeOf(context).width;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Center(
                    child: Container(
                      height: hight * 0.4,
                      width: wdith * 0.4,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'Assest/images/login.jpg',
                        ),
                      )),
                    ),
                  ),
                  const Text(
                    'أهلاََ بك',
                    style: TextStyle(fontSize: 20, fontFamily: 'jannah'),
                  ),
                  const Text(
                    'سجل دخولك الى حسابك الان',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'jannah',
                        color: Color(0xFFb4b4b4)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DafulteTextForm(
                          title: 'الايميل',
                          prfixIcon: const Icon(Icons.person),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DafulteTextForm(
                          controller: passwordController,
                          title: "كلمة السر",
                          prfixIcon: const Icon(IconlyBroken.password),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'نسيت كلمة السر؟؟',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'jannah',
                                  color: Color(0xFFb4b4b4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Boutton(
                    hieght: 40,
                    wdith: 150,
                    titil: 'تسجيل الدخوول',
                    isLoding: false,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'لا تمتلك حساب؟؟',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'jannah',
                            color: Color(0xFFb4b4b4)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'سجل!!',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'jannah',
                              color: Color(0xff0545a8)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
