import 'package:e_commerce_app/config/router/app_rout.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/services/services_locator.dart';
import 'config/theme/app_theme.dart';
import 'features/auth/presentation/cubit/cubit.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        routes: routes,
        
      ),
    );
  }
}
