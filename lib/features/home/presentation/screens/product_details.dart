import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/model/items_color.dart';
import '../../domain/entities/home.dart';
import '../widgets/smooth_page_indector.dart';
import 'home.dart';

class ProductDetalisScreen extends StatelessWidget {
  final ProductEntities? productEntities;
  ProductDetalisScreen({
    super.key,
    this.productEntities,
  });

  //bool isExpanded = true;
  int indexIndector = 0;
  final List<ItemsColor> itemsColor = [
    ItemsColor(
      colorName: 'Sky Blue',
      color: AppColors.skyBlueColor,
    ),
    ItemsColor(
      colorName: 'Rose Gold',
      color: AppColors.roseGoldColor,
    ),
    ItemsColor(
      colorName: 'Green',
      color: AppColors.greenColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        actions: [
          Image.asset(favouriteIcons),
          SizedBox(
            width: context.width * 0.05,
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: CarouselSlider.builder(
                  itemCount: productEntities!.images.length,
                  itemBuilder: (context, index, realIndex) {
                    return SizedBox(
                      child: CachedNetworkImage(
                        imageUrl: productEntities!.images[index],
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: ShimmerWidget(
                            color: AppColors.whiteColor,
                            widget: Shimmer.fromColors(
                              baseColor: AppColors.backgroundColor,
                              highlightColor:
                                  AppColors.backgroundColor.withOpacity(0.2),
                              child: Container(
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
                      cubit.changeCarouselIndector(index);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        count: productEntities!.images.length,
                        activeIndex: cubit.carouselCurrentIndex.toDouble(),
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.grey,
                        size: 12.0,
                        spacing: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 11,
                child: Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.sp, horizontal: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: productEntities!.name,
                              size: 25.sp,
                              fontWeight: AppFontWeight.semiBold,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              textOverflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          CustomText(
                            text: AppString.colors,
                            size: 20.sp,
                            fontWeight: AppFontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          SizedBox(
                            height: context.height * 0.06,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: context.width * 0.02,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: itemsColor.length,
                              itemBuilder: (context, index) {
                                return SectionOfColor(
                                  index: index,
                                  itemsColor: itemsColor,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.02,
                          ),
                          CustomText(
                            text: AppString.discountText,
                            size: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: context.height * 0.014,
                          ),
                          CustomText(
                            text: productEntities!.description,
                            color: AppColors.blackColor.withOpacity(0.5),
                            maxLines: cubit.isExpanded ? null : 5,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: AppFontWeight.regular,
                            size: 15.sp,
                          ),
                          SizedBox(
                            height: context.height * 0.005,
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.changeExpanded(cubit.isExpanded);
                            },
                            child: CustomText(
                              text: cubit.isExpanded
                                  ? AppString.readMore
                                  : AppString.readless,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              size: AppFontSize.s14,
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                text: AppString.totalPrice,
                                size: 22.sp,
                                fontWeight: AppFontWeight.regular,
                                color: AppColors.blackColor,
                              ),
                              const Spacer(),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    const TextSpan(text: 'EGP '),
                                    TextSpan(
                                      text:
                                          '${productEntities!.price.round()} ',
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              if (productEntities!.discount != 0)
                                Text(
                                  '${productEntities!.oldPrice.round()}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.lightGrey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.03,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              text: AppString.addToBasket,
                              color: AppColors.primaryColor,
                              textColor: AppColors.whiteColor,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SectionOfColor extends StatelessWidget {
  final List<ItemsColor> itemsColor;
  final int index;
  const SectionOfColor({
    super.key,
    required this.itemsColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.055,
      width: context.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.ofWhiteColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: itemsColor[index].color,
            radius: 10,
          ),
          SizedBox(
            width: context.width * 0.02,
          ),
          CustomText(
            size: 14.sp,
            text: itemsColor[index].colorName,
            fontWeight: AppFontWeight.bold,
          )
        ],
      ),
    );
  }
}
