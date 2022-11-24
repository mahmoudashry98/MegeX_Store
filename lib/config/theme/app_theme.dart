import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/app_style.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      // todo main Colors
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
        color: AppColors.balckColor,
        elevation: AppSize.s4,
        shadowColor: AppColors.primaryColor,
        titleTextStyle: getBoldStyle(
          fontSize: AppFontSize.s18,
          color: AppColors.whiteColor,
        ),
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
          textStyle: getBoldStyle(
            color: AppColors.primaryColor,
            fontSize: AppFontSize.s20,
          ),
          backgroundColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s12,
            ),
          ),
        ),
      ),

      //text theme
      textTheme: TextTheme(
        headline1: getSemiBoldStyle(
            fontSize: AppFontSize.s16, color: AppColors.whiteColor),
        subtitle1: getMediumStyle(
            color: AppColors.lightGrey, fontSize: AppFontSize.s14),
        caption: getRegularStyle(color: AppColors.lightGrey),
        bodyText1: getRegularStyle(color: AppColors.grey),
      ),

      //inputDecoration theme (textFormFiled)
      inputDecorationTheme: InputDecorationTheme(
        //content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),

        //hint style
        hintStyle: getSemiBoldStyle(
            color: AppColors.hintColor, fontSize: AppFontSize.s17),

        //label style
        labelStyle: getSemiBoldStyle(
            color: AppColors.labelColor, fontSize: AppFontSize.s15),

        //error style
        errorStyle: getSemiBoldStyle(color: AppColors.errorColor),

        //enable border
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8) )
        ),

        //focused border
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8) )
        ),

        //error border style
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8) )
        ),

        //focused border
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8) )
        ),
        
      ));
}
