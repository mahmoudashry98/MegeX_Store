import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/config/router/app_rout.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/services/services_locator.dart';
import 'config/theme/app_theme.dart';
import 'features/auth/presentation/cubit/cubit.dart';
import 'features/caregories/presentation/cubit/cubit.dart';


class MyApp extends StatelessWidget {
  MyApp.internal();

  static final MyApp instance = MyApp.internal();

  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => sl<HomeCubit>()..getHomeData(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => sl<CategoriesCubit>()..getCategoriesData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            //theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            routes: routes,
            //home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
