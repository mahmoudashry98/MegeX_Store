import 'package:e_commerce_app/bloc_observer.dart';
import 'package:e_commerce_app/config/services/services_locator.dart';
import 'package:e_commerce_app/config/theme/app_theme.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>()
        ,
      child: MaterialApp(
        theme: appTheme(),
        home: LoginScreen(),
      ),
    );
  }
}
