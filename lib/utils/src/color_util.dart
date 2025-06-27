import 'dart:ui';

class ColorUtil {
  static Color hexStringColor(String colorString) {
    String colorStr = colorString;

    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    } else if (colorStr.startsWith('#') && colorStr.length == 9) {
      colorStr = colorStr.replaceRange(0, 1, '0x');
    } else if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    } else if (colorStr.startsWith('0x') && colorStr.length == 10) {}

    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    int alpha = color.alpha;
    return Color.fromARGB(alpha, red, green, blue);
  }

  static String colorToHexString(
    Color color, {
    bool includeHashSign = true,
    bool includeAlpha = true,
  }) {
    // 提取 ARGB 分量（范围 0-255）
    final alpha = color.alpha;
    final red = color.red;
    final green = color.green;
    final blue = color.blue;

    // 转换为两位十六进制字符串（大写）
    final alphaHex = _toTwoDigitHex(alpha);
    final redHex = _toTwoDigitHex(red);
    final greenHex = _toTwoDigitHex(green);
    final blueHex = _toTwoDigitHex(blue);

    // 根据参数拼接结果
    final buffer = StringBuffer();
    if (includeHashSign) buffer.write('#');
    if (includeAlpha) buffer.write(alphaHex);
    buffer.write('$redHex$greenHex$blueHex');

    return buffer.toString();
  }

  static String _toTwoDigitHex(int value) {
    assert(value >= 0 && value <= 255);
    return value.toRadixString(16).padLeft(2, '0').toUpperCase();
  }
}
