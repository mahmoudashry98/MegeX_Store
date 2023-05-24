import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_fonts.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_asstes_path.dart';
import '../../data/model/items_color.dart';
import '../widgets/smooth_page_indector.dart';
import 'home.dart';

class ProductDetalisScreen extends StatefulWidget {
  final int? indexProduct;
  const ProductDetalisScreen({
    super.key,
    this.indexProduct,
  });

  @override
  State<ProductDetalisScreen> createState() => _ProductDetalisScreenState();
}

class _ProductDetalisScreenState extends State<ProductDetalisScreen> {
  bool isExpanded = false;
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
    final textTheme = Theme.of(context).textTheme;
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
          Expanded(
            flex: 4,
            child: CarouselSlider.builder(
              itemCount: cubit.allProduct[widget.indexProduct!].images.length,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  child: CachedNetworkImage(
                    imageUrl:
                        cubit.allProduct[widget.indexProduct!].images[index],
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
                            color: AppColors.errorColor,
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
                  setState(
                    () {
                      indexIndector = index;
                    },
                  );
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
                    count: cubit.allProduct[widget.indexProduct!].images.length,
                    activeIndex: indexIndector.toDouble(),
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
            flex: 10,
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
                padding:
                    EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: cubit.allProduct[widget.indexProduct!].name,
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
                      text: 'Colors',
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
                  ],
                ),
              ),
            ),
          ),
        ],
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
