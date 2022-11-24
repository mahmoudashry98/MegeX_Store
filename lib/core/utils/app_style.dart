import 'dart:core';

import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

//regular style
TextStyle getRegularStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.regular,
    color,
  );
}

//medium style
TextStyle getMediumStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.meduim,
    color,
  );
}

//light style
TextStyle getLightStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.light,
    color,
  );
}

//bold style
TextStyle getBoldStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.bold,
    color,
  );
}


//semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = AppFontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    AppFontWeight.semiBold,
    color,
  );
}