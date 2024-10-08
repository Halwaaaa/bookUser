import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/featuers/Drawer/persenation/view/clock/clock.dart';
import 'package:user/featuers/Drawer/persenation/Widget/Info_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user/core/constant/pageRoute.dart';
import 'package:user/shard/cubit/Darwer.dart/cubitclock.dart';

List<bool> isActive = [false, false, false, false];

class DrawerView extends StatefulWidget {
  DrawerView({super.key, this.open});
  bool? open = true;

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF17203A),
          child: SafeArea(
              child: Column(children: [
            const iconcard(
              name: "halwa",
              profile: "person",
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: Divider(
                color: Colors.white24,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Column(
                  children: [
                    ItemOfDrower(
                      titel: "منبه طبي ",
                      icon: FontAwesomeIcons.clock,
                      ontap: () {
                        Navigator.push(
                            context,
                            page(
                                pagee: BlocProvider(
                                    create: (context) =>
                                        AppCubit()..creatDataBase(),
                                    child: const test())));
                      },
                    ),
                    const ItemOfDrower(
                      titel: "سجل طبي",
                      icon: FontAwesomeIcons.times,
                    ),
                    const ItemOfDrower(
                      titel: "تسجيل خروج",
                      icon: FontAwesomeIcons.accessibleIcon,
                    ),
                  ],
                ),
              ),
            )
          ]))),
    );
  }
}

class ItemOfDrower extends StatelessWidget {
  const ItemOfDrower({
    super.key,
    required this.titel,
    required this.icon,
    this.ontap,
  });
  final String titel;
  final IconData icon;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          leading: IconButton(onPressed: () {}, icon: Icon(icon)),
          title: Text(
            titel,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Divider(
          color: Colors.white24,
          height: 2,
        ),
      ],
    );
  }
}
