import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/core/network/local/shared/shared_preferences.dart';
import 'package:e_commerce_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'config/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  ServicesLocator().init();
  runApp(MyApp());
}
