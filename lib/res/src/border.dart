import 'package:flutter/material.dart';

BorderRadiusDirectional borderRadius(double radius) {
  return BorderRadiusDirectional.all(Radius.circular(radius));
}

BorderRadiusDirectional topBorderRadius(double left, double right) {
  return BorderRadiusDirectional.only(
    topEnd: Radius.circular(left),
    topStart: Radius.circular(right),
  );
}

BorderRadiusDirectional bottomBorderRadius(double left, double right) {
  return BorderRadiusDirectional.only(
    bottomStart: Radius.circular(left),
    bottomEnd: Radius.circular(right),
  );
}

BorderRadiusDirectional leftBorderRadius(double bottom, double top) {
  return BorderRadiusDirectional.only(
    bottomStart: Radius.circular(bottom),
    topStart: Radius.circular(top),
  );
}

BorderRadiusDirectional rightBorderRadius(double bottom, double top) {
  return BorderRadiusDirectional.only(
    bottomEnd: Radius.circular(bottom),
    topEnd: Radius.circular(top),
  );
}

BorderRadiusDirectional radius({
  double tl = 0.0,
  double tr = 0.0,
  double bl = 0.0,
  double br = 0.0,
  double others = 0.0,
}) {
  return BorderRadiusDirectional.only(
    topStart: Radius.circular(tl),
    topEnd: Radius.circular(tr),
    bottomStart: Radius.circular(bl),
    bottomEnd: Radius.circular(br),
  );
}

BoxBorder border(Color color, double width) =>
    Border.all(color: color, width: (width));
