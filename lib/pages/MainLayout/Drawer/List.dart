import 'package:flutter/material.dart';
import 'package:user/shard/commponted/Widget/Info_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          child: const SafeArea(
              child: Column(children: [
            iconcard(
              name: "halwa",
              profile: "person",
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Divider(
                color: Colors.white24,
                height: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8),
                child: Column(
                  children: [
                    ItemOfDrower(
                      titel: "منبه طبي ",
                      icon: FontAwesomeIcons.clock,
                    ),
                    ItemOfDrower(
                      titel: "سجل طبي",
                      icon: FontAwesomeIcons.times,
                    ),
                    ItemOfDrower(
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
  });
  final String titel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () async {},
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
