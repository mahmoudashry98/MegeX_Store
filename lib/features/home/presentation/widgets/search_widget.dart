import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class SearchWidget extends StatelessWidget {
  final double? height, width;
  final bool? isKeyboardOped;
  final VoidCallback? press;
  const SearchWidget(
      {this.press, super.key, this.height, this.width, this.isKeyboardOped});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: width,
        child: TextField(
          readOnly: isKeyboardOped!,
          cursorColor: AppColors.primaryColor,
          onTap: press,
          maxLines: 1,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1,
              ),
            ),
            hintText: AppString.search,
            hintStyle: TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppFontSize.s18,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
