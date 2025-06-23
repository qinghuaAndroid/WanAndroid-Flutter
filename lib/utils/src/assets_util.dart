const String _assetsPath = "assets/images/3.0x/";

///圖片
String assetImage(String assetName, {final String? suffix}) {
  return "$_assetsPath$assetName${suffix ?? '.png'}";
}

String assetLottie(String assetName, {final String? suffix}) {
  return "$_assetsPath$assetName${suffix ?? '.json'}";
}

String assetSvg(String assetName, {final String? suffix}) {
  return "$_assetsPath$assetName${suffix ?? '.svg'}";
}
