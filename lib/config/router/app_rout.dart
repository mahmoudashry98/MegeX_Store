import 'package:e_commerce_app/features/auth/presentation/screens/login.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/register.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home.dart';
import 'package:e_commerce_app/features/home/presentation/screens/product_details.dart';
import 'package:e_commerce_app/features/home/presentation/screens/search.dart';

import '../../features/basket/presentation/screens/basket.dart';
import '../../features/basket/presentation/screens/checkout.dart';
import '../../features/home/presentation/screens/layout.dart';
import '../../features/splash/splash_screen.dart';

class AppRouts {
  static const String initialRoute = '/';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String layoutScreen = '/layoutScreen';
  static const String homeScreen = '/homeScreen';
  static const String searchScreen = '/search';
  static const String productDetailsScreen = '/productDetalisScreen';
  static const String basketScreen = '/basketScreen';
  static const String checkOutScreen = '/checkOutScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const SplashScreen(),
  AppRouts.loginScreen: (context) => const LoginScreen(),
  AppRouts.registerScreen: (context) => const RegisterScreen(),
  AppRouts.layoutScreen: (context) => const LayoutScreen(),
  AppRouts.homeScreen: (context) => const HomeScreen(),
  AppRouts.searchScreen: (context) => SearchScreen(),
  AppRouts.productDetailsScreen: (context) => ProductDetalisScreen(),
  AppRouts.basketScreen: (context) => const BasketScreen(),
  AppRouts.checkOutScreen: (context) => const CheckOutScreen(),
};
