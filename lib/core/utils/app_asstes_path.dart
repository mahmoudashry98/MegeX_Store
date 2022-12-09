const String imageAssetsRoot = "assets/images/";
const String iconAssetsRoot = "assets/icons/";


//images path
 String splashImage = _getAssetsImagePath('splash.png');
 String ellipse19 = _getAssetsImagePath('Ellipse 19.png');
 String ellipse20 = _getAssetsImagePath('Ellipse 20.png');
 String ellipse21 = _getAssetsImagePath('Ellipse 21.png');





//icons path
String emailIcons = _getAssetsIconPath('Email.png');
String lockIcons = _getAssetsIconPath('Lock.png');
String showIcons = _getAssetsIconPath('Show.png');


String _getAssetsImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getAssetsIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}

