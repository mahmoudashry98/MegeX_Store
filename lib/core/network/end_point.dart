class EndPoint {
  static const String baseUrl1 = 'https://student.valuxapps.com/api/';
  static const String baseUrl2 = 'https://mahmoudashry98.mocklab.io/';
  static const String login = 'https://student.valuxapps.com/api/login';
  static const String register = 'https://student.valuxapps.com/api/register';
  static const String logout = 'https://student.valuxapps.com/api/logout';
  static const String profile = 'https://student.valuxapps.com/api/profile';
  static const String home = 'https://mahmoudashry98.mocklab.io/home';
  static const String categories =
      'https://mahmoudashry98.mocklab.io/categories';
  static const String product = 'https://mahmoudashry98.mocklab.io/products';

  Environment? environment;
}

String? token;

const _baseUrl = "baseUrl";

enum Environment { softagi, mockLab }

Map<String, dynamic>? _config;

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.softagi:
      _config = softagiConstants;
      break;
    case Environment.mockLab:
      _config = mockLabConstants;
      break;
  }
}

dynamic get apiBaseUrl {
  return _config![_baseUrl];
}

Map<String, dynamic> softagiConstants = {
  _baseUrl: "https://student.valuxapps.com/api/",
};

Map<String, dynamic> mockLabConstants = {
  _baseUrl: "https://mahmoudashry98.mocklab.io/",
};
