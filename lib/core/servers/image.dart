import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Uint8List> getImageDataRow(
    String image, double width, double hight) async {
  var imagrData = await rootBundle.load(image);
  var imgeCode = await ui.instantiateImageCodec(imagrData.buffer.asUint8List(),
      targetHeight: hight.round(), targetWidth: width.round());
  var imageFram = await imgeCode.getNextFrame();
  var imagebutData =
      await imageFram.image.toByteData(format: ui.ImageByteFormat.png);

  return imagebutData!.buffer.asUint8List();
}

Future<Image> getimages() async {
  return Image.memory(await getImageDataRow('images/doctor_9.jpg', 100, 50));
}
