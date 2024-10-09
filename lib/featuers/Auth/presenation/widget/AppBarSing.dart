import 'package:flutter/material.dart';

class AppBarSing extends StatelessWidget {
  const AppBarSing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              fontSize: 15, fontFamily: 'jannah', color: Color(0xFFb4b4b4)),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
