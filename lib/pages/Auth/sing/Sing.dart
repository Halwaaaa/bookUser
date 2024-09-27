import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/shard/commponted/Dafult/DafultBoutton.dart';
import 'package:user/shard/commponted/Dafult/DafultTextFormFiled.dart';
import 'package:user/shard/constant/config.dart';
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
                const SizedBox(
                  height: 75,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  '!! هياا لنبدأ',
                  style: TextStyle(fontSize: 20, fontFamily: 'jannah'),
                ),
                const Text(
                  'أنشأ حسابك للتواصل مع طبيبك. ',
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
                    cubit.SingWithEmail(context);

                    // if (keyform.currentState!.validate()) {
                    //   // navigateTo(
                    //   //     context,
                    //   //     singtwo(
                    //   //       ageControlle: ageController.text,
                    //   //       locationController: locationController.text,
                    //   //       nameController: nameController.text,
                    //   //       phoneController: phoneController.text,
                    //   //     ));
                    // }
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
