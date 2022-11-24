import 'package:e_commerce_app/features/auth/presentation/screens/login.dart';

import '../../features/splash/splash_screen.dart';

class AppRouts{
  static const String initialRoute = '/';
  static const String loginScreen = '/loginScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const SplashScreen(),
  AppRouts.loginScreen: (context) => const LoginScreen(),
};