import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_asstes_path.dart';

class ProductDetalisScreen extends StatefulWidget {
  final int argIndex;
  const ProductDetalisScreen({super.key, required this.argIndex});
  @override
  State<ProductDetalisScreen> createState() => _ProductDetalisScreenState();
}

class _ProductDetalisScreenState extends State<ProductDetalisScreen> {
  int indexIndector = 0;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: CarouselSlider.builder(
              itemCount: cubit.allProduct[1].images.length,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  child: Image.network(
                    cubit.allProduct[2].images[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
              options: CarouselOptions(
                height: context.height * 0.3,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                scrollPhysics: const BouncingScrollPhysics(),
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                pageSnapping: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    indexIndector = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          SizedBox(
            height: context.height * 0.04,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return CircleAvatar(
                  radius: 10,
                  backgroundColor: i != indexIndector
                      ? AppColors.backgroundColor
                      : AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: i != indexIndector
                        ? AppColors.backgroundColor
                        : AppColors.backgroundColor,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: i != indexIndector
                            ? AppColors.grey
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cubit.allProduct[1].images.length,
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

// class DotIndectorWidget extends StatelessWidget {
//   const DotIndectorWidget({
//     super.key,
//     required this.indexIndector,
//     required this.index,
//   });

//   final int indexIndector;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
