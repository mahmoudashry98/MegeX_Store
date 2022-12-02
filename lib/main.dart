import 'package:e_commerce_app/bloc_observer.dart';
import 'package:e_commerce_app/config/services/services_locator.dart';

import 'package:e_commerce_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ServicesLocator().init();
  runApp( MyApp());
}
