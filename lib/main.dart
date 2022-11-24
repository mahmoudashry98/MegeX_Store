import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/bloc_observer.dart';
import 'package:e_commerce_app/config/services/services_locator.dart';

import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/app_colors.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // navigation bar color
      statusBarColor: AppColors.primaryColor, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  runApp( DevicePreview(builder: (context) => MyApp()));
}

