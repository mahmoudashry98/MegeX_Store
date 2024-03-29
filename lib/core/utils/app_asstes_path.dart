const String imageAssetsRoot = "assets/images/";
const String iconAssetsRoot = "assets/icons/";

//images path
String splashImage = _getAssetsImagePath('splash.png');
String ellipse19 = _getAssetsImagePath('Ellipse 19.png');
String ellipse20 = _getAssetsImagePath('Ellipse 20.png');
String ellipse21 = _getAssetsImagePath('Ellipse 21.png');
String categoryElctronics = _getAssetsImagePath('Elctronics.png');
String productImage = _getAssetsImagePath('product.png');
String notFoundImage = _getAssetsImagePath('not_found.png');
String maskGroupImage = _getAssetsImagePath('Mask Group.png');
String visaImage = _getAssetsImagePath('visa.png');
String mastercardImage = _getAssetsImagePath('mastercard.png');

//icons path
String emailIcons = _getAssetsIconPath('Email.png');
String lockIcons = _getAssetsIconPath('Lock.png');
String showIcons = _getAssetsIconPath('Show.png');
String phoneIcons = _getAssetsIconPath('phone.png');
String profileIcons = _getAssetsIconPath('Profile.png');
String faceBookIcons = _getAssetsIconPath('facebook-256.png');
String googleIcons = _getAssetsIconPath('google-icon.svg');
String menuIcons = _getAssetsIconPath('Vector.png');
String favouriteIcons = _getAssetsIconPath('Heart.png');
String deleteIcons = _getAssetsIconPath('Delete.png');
String notificationIcons = _getAssetsIconPath('Notification.png');
String errorIcons = _getAssetsIconPath('Slice 1.svg');
String locationIcons = _getAssetsIconPath('Location.png');

String _getAssetsImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getAssetsIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}
