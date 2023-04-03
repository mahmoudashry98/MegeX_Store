import 'dart:math';

import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/features/home/data/model/home.dart';
import 'package:e_commerce_app/features/home/domain/entities/home.dart';
import 'package:e_commerce_app/features/home/domain/usecase/home.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:e_commerce_app/features/home/presentation/screens/cart.dart';
import 'package:e_commerce_app/features/home/presentation/screens/favourite.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/screens/profile.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeCubit({required this.getHomeDataUseCase}) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

//tabCurrentIndex
  int tabCurrentIndex = 0;

//CurrentBottomNavIndex
  int bottomNavCurrentIndex = 0;

//List of Item in TabBar
  List<String> items = [
    'Wearable',
    'Laptops',
    'Phones',
    'Drones',
  ];

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const FavouriteScreen(),
     const CartScreen(),
    const ProfileScreen(),
   
  ];

  //BottomNav
  void changeBottomNav(int index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  void changeTabBar(int index) {
    tabCurrentIndex = index;
    emit(ChangeTabBarState());
  }

  HomeEntities? homeDataModel;

  ProductEntities? productModel;

  void shuffleList(List<ProductModel> list) {
    final random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }

  Future<void> getHomeData() async {
    emit(GetHomeDataLoadingState());

    var response = await getHomeDataUseCase(const NoParemeters());

    response.fold(
      (l) {
        print('Error ${l.message}');
        emit(GetHomeDataErrorState(messageError: l.message));
      },
      (r) {
        homeDataModel = r;
        //print('ProductModel $homeDataModel');
        emit(GetHomeDataLoadedState());
      },
    );
  }
}
