import 'package:e_commerce_app/bloc_observer.dart';
import 'package:e_commerce_app/config/services/services_locator.dart';

import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  runApp(
    DevicePreview(
      isToolbarVisible: true,
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
