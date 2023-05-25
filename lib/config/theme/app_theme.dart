import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: false,
    //main Colors
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    splashColor: AppColors.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    //card theme
    cardTheme: CardTheme(
      color: AppColors.whiteColor,
      shadowColor: AppColors.grey,
      elevation: AppSize.s4,
    ),

    //appBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.blackColor,
      elevation: AppSize.s4,
      shadowColor: AppColors.primaryColor,
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: AppColors.grey,
      buttonColor: AppColors.primaryColor,
      splashColor: AppColors.primaryColor,
    ),

    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        // backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
      ),
    ),

    // //inputDecoration theme (textFormFiled)
    // inputDecorationTheme: InputDecorationTheme(
    //   //content padding
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),

    //   //enable border
    //   enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //   //focused border
    //   focusedBorder: OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: AppColors.primaryColor, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

    //   //error border style
    //   // errorBorder: OutlineInputBorder(
    //   //   borderSide: BorderSide(color: AppColors.errorColor, width: AppSize.s1_5),
    //   //   borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8) )
    //   // ),

    //   //focused border
    //   focusedErrorBorder: OutlineInputBorder(
    //       borderSide:
    //           BorderSide(color: AppColors.primaryColor, width: AppSize.s1_5),
    //       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    // ),
  );
}
