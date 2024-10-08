import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class iconcard extends StatelessWidget {
  const iconcard({
    Key? kry,
    required this.name,
    required this.profile,
  }) : super(key: kry);

  final String profile;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style:
            const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
      subtitle: Text(
        profile,
        style:
            const TextStyle(color: Colors.white, fontStyle: FontStyle.normal),
      ),
    );
  }
}
