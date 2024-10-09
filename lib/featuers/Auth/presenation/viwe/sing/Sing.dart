import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/commponted/Dafult/DafultBoutton.dart';
import 'package:user/core/commponted/Dafult/DafultTextFormFiled.dart';
import 'package:user/core/constant/config.dart';
import 'package:user/featuers/Auth/presenation/widget/AppBarSing.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/cubitAuth.dart';
import 'package:user/shard/cubit/AuthSin/AuthSing/stateAuth.dart';

class SingView extends StatelessWidget {
  const SingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitSin, AppStatesSing>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubitSin.get(context);
        Config config = Config();
        //  print()
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarSing(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: cubit.keyform,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DafulteTextForm(
                            controller: cubit.EmailControol,
                            title: "البريد الكتروني",
                            validator: config.validator),
                        const SizedBox(
                          height: 20,
                        ),
                        DafulteTextForm(
                          controller: cubit.NameControol,
                          title: "الاسم ",
                          validator: config.validator,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DafulteTextForm(
                          controller: cubit.phoneControol,
                          title: "الهاتف",
                          validator: (f) {
                            if (f!.isEmpty) {
                              return "الحقل مطلوب";
                            } else if (double.tryParse(f) == null) {
                              return 'الرجاء ادخال رقم صالح';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DafulteTextForm(
                          controller: cubit.PasswordControol,
                          title: "كلمة السر ",
                          validator: config.validator,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Boutton(
                  hieght: 70,
                  wdith: 150,
                  isLoding: cubit.loding,
                  titil: "سجل",
                  ontap: () {
                    cubit.TapSin(context);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
