import 'package:flutter/material.dart';

class ItemDate extends StatelessWidget {
  const ItemDate({super.key, required this.canceld});
  final bool canceld;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/portrait-fair-haired-beautiful-female-woman-with-broad-smile-thumbs-up_176420-14970.jpg?w=740&t=st=1677387568~exp=1677388168~hmac=7be1350ca20645b1de2db1d545e0a3785d3fc0c0879c0d8c93ae350795501103'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'namw',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontFamily: 'jannah',
                            ),
                          ),
                          Text(
                            'ddd',
                            style: TextStyle(
                              color: Color(0xff304250),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jannah',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SchedCard(context),
                  const SizedBox(
                    height: 20,
                  ),
                  if (canceld)
                    const Center(
                      child: Text(
                        'للاسف تم رفض موعدك ',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'jannah'),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget SchedCard(context) => Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 15,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              //يجب تصحيح الصيغة
              ",;;;;;;;;;;;;;;;; ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.access_alarm,
              color: Colors.white,
              size: 17,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "   PM",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
}
