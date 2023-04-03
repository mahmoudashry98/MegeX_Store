import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        //var tabCurrentIndex = cubit.tabCurrentIndex;
        var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.black26,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: bottomNavCurrentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
          body: IndexedStack(
            index: bottomNavCurrentIndex,
            children: cubit.bottomScreens,
          ),
        );
      },
    );
  }
}
