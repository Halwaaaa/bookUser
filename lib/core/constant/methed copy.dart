import 'package:flutter/widgets.dart';

double ResponsvTextSize(double scale, double max, double min) {
  if (scale > max) {
    return max;
  } else if (scale < min) {
    return min;
  }
  return scale;
}

double ResponsvTextSizemix(
  double scale,
  double max,
) {
  if (scale > max) {
    return max;
  }
  return scale;
}
