import 'package:e_commerce_app/features/auth/presentation/screens/login.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/register.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home.dart';

import '../../features/splash/splash_screen.dart';

class AppRouts{
  static const String initialRoute = '/';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const SplashScreen(),
  AppRouts.loginScreen: (context) => const LoginScreen(),
  AppRouts.registerScreen: (context) => const RegisterScreen(),
  AppRouts.homeScreen: (context) => const HomeScreen(),
};