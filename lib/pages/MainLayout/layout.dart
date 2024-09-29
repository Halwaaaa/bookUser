import 'package:flutter/material.dart';

class layoutView extends StatelessWidget {
  const layoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "kkk",
              style: TextStyle(fontSize: 200),
            ),
          )
        ],
      ),
    );
  }
}
