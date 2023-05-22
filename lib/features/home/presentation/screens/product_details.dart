import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_asstes_path.dart';

class ProductDetalisScreen extends StatelessWidget {
  final int? index1;
  const ProductDetalisScreen({super.key, this.index1});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.balckColor,
        ),
        actions: [
          Image.asset(favouriteIcons),
          SizedBox(
            width: context.width * 0.05,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.5,
            width: context.width,
            child: Row(
              children: [
                Image.asset(
                  maskGroupImage,
                ),
                Image.asset(maskGroupImage),
              ],
            ),
          )
        ],
      ),
    );
  }
}
