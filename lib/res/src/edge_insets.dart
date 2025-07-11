import 'package:flutter/material.dart';

// 没有null safety之前，前面的??=不要删掉
EdgeInsetsDirectional insets({
  double? top,
  double? start,
  double? bottom,
  double? end,
  double? others,
}) {
  return EdgeInsetsDirectional.only(
    top: top ?? others ?? 0.0,
    start: start ?? others ?? 0.0,
    bottom: bottom ?? others ?? 0.0,
    end: end ?? others ?? 0.0,
  );
}

EdgeInsetsDirectional insetsAll(double value) {
  return EdgeInsetsDirectional.all(value);
}

EdgeInsetsDirectional horizontalInsetsEq(double horizontal) {
  return EdgeInsetsDirectional.symmetric(horizontal: horizontal);
}

EdgeInsetsDirectional horizontalInsets(double start, double end) {
  return EdgeInsetsDirectional.only(start: start, end: end);
}

EdgeInsetsDirectional verticalInsetsEq(double vertical) {
  return EdgeInsetsDirectional.symmetric(vertical: vertical);
}

EdgeInsetsDirectional verticalInsets(double top, double bottom) {
  return EdgeInsetsDirectional.only(top: top, bottom: bottom);
}

EdgeInsetsDirectional symmetricInsets(double horizontal, double vertical) {
  return EdgeInsetsDirectional.symmetric(
    horizontal: horizontal,
    vertical: vertical,
  );
}

EdgeInsetsDirectional leftInset(double inset) {
  return EdgeInsetsDirectional.only(start: inset);
}

EdgeInsetsDirectional rightInset(double inset) {
  return EdgeInsetsDirectional.only(end: inset);
}

EdgeInsetsDirectional topInset(double inset) {
  return EdgeInsetsDirectional.only(top: inset);
}

EdgeInsetsDirectional bottomInset(double inset) {
  return EdgeInsetsDirectional.only(bottom: inset);
}
