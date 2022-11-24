const String imageAssetsRoot = "assets/images/";
const String iconAssetsRoot = "assets/icons/";

 String splashImage = _getAssetsImagePath('splash.png');

String _getAssetsImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getAssetsIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}

