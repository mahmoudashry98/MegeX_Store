import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/caregories/presentation/cubit/state.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/home/presentation/screens/product_details.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../config/router/app_rout.dart';
import '../../../../core/utils/app_asstes_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../caregories/presentation/cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          late int? itemCount =
              HomeCubit.get(context).homeDataModel!.data.products.length;
          final homeCubit = HomeCubit.get(context);
          final tabCurrentIndex = homeCubit.tabCurrentIndex;
          return state is! GetHomeDataErrorState &&
                  state is! GetCategoriesDataErrorState
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.sp,
                        left: 40.sp,
                        bottom: 10.sp,
                      ),
                      child: Row(
                        children: [
                          Image.asset(menuIcons),
                          SizedBox(
                            width: context.width / 20,
                          ),
                          SearchWidget(
                            isKeyboardOped: true,
                            width: context.width * 0.66,
                            press: () => Navigator.pushNamed(
                              context,
                              AppRouts.searchScreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TopNavgtationBar(
                      homeCubit: homeCubit,
                      tabCurrentIndex: tabCurrentIndex,
                    ),
                    SizedBox(
                      height: context.height / 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CustomText(
                            text: AppString.specialForYou,
                            size: AppFontSize.s20,
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                          const Spacer(),
                          CustomText(
                            text: AppString.seeMore,
                            size: AppFontSize.s15,
                            color: AppColors.primaryColor,
                            fontWeight: AppFontWeight.extraSemiBold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height / 40,
                    ),
                    SizedBox(
                      height: context.height * 0.17,
                      child: BlocConsumer<CategoriesCubit, CategoriesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          var categoriesCubit = CategoriesCubit.get(context);
                          late int? itemCountCategory =
                              categoriesCubit.categoryModel!.data.length;
                          return ListView.separated(
                            itemCount: state is GetCategoriesLoadingState
                                ? 5
                                : itemCountCategory,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) => SizedBox(
                              width: context.width * 0.03,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return state is GetCategoriesLoadingState
                                  ? const ShimmerCategoryWidget()
                                  : CategoryWidget(
                                      categoryCubit: categoriesCubit,
                                      index: index,
                                    );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: context.height / 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CustomText(
                            text: AppString.popularProduct,
                            size: AppFontSize.s20,
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                          const Spacer(),
                          CustomText(
                            text: AppString.seeMore,
                            size: AppFontSize.s15,
                            color: AppColors.primaryColor,
                            fontWeight: AppFontWeight.extraSemiBold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.35,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return state is GetHomeDataLoadingState
                              ? const ShimmerProductWidget()
                              : GestureDetector(
                                  onTap: () {
                                    print('index$index');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetalisScreen(
                                          productEntities:
                                              homeCubit.allProduct[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ItemsOfPoductWidget(
                                    homeCubit: homeCubit,
                                    index: index,
                                  ),
                                );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 5),
                        itemCount:
                            state is GetHomeDataLoadingState ? 5 : itemCount,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(errorIcons),
                      CustomText(
                        text: 'Oops...!',
                        size: 35.sp,
                        fontWeight: AppFontWeight.meduim,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      CustomText(
                        text: 'Something Went Worng. Please try again later.',
                        size: 16.sp,
                        fontWeight: AppFontWeight.meduim,
                        color: AppColors.primaryColor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class ItemsOfPoductWidget extends StatelessWidget {
  const ItemsOfPoductWidget({
    Key? key,
    required this.homeCubit,
    required this.index,
  }) : super(key: key);

  final HomeCubit homeCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ProductWidget(
      cubit: homeCubit,
      index: index,
    );
  }
}

class TopNavgtationBar extends StatelessWidget {
  const TopNavgtationBar({
    Key? key,
    required this.homeCubit,
    required this.tabCurrentIndex,
  }) : super(key: key);

  final HomeCubit homeCubit;
  final int tabCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: SizedBox(
        height: context.height * 0.06,
        width: context.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeCubit.changeTabBar(index);
              },
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m12),
                width: context.width * 0.2,
                height: context.height * 0.2,
                decoration: BoxDecoration(
                  border: tabCurrentIndex == index
                      ? Border(
                          bottom: BorderSide(
                            color: AppColors.primaryColor,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        )
                      : const Border(),
                ),
                child: Center(
                  child: CustomText(
                    text: homeCubit.items[index],
                    color: tabCurrentIndex == index
                        ? AppColors.primaryColor
                        : AppColors.lightGrey,
                    size: AppSize.s18,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
              ),
            );
          },
          itemCount: homeCubit.items.length,
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final CategoriesCubit categoryCubit;
  final int index;
  const CategoryWidget({
    Key? key,
    required this.categoryCubit,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              SizedBox(
                height: context.height * 0.19,
                width: context.width * 0.53,
                child: CachedNetworkImage(
                  imageUrl: categoryCubit.categoryModel!.data[index].image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: ShimmerWidget(
                      color: AppColors.whiteColor,
                      widget: Shimmer.fromColors(
                        baseColor: Colors.grey.shade50,
                        highlightColor: AppColors.lightGrey.withOpacity(0.2),
                        child: Container(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: categoryCubit.categoryModel!.data[index].name,
                      color: AppColors.whiteColor,
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: '10 Brands',
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerCategoryWidget extends StatelessWidget {
  const ShimmerCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              ShimmerWidget(
                height: context.height * 0.19,
                width: context.width * 0.53,
                color: AppColors.whiteColor,
                widget: Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: AppColors.lightGrey.withOpacity(0.2),
                  child: Container(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ShimmerWidget(
                        width: context.width * 0.22,
                        height: context.height * 0.023,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ShimmerWidget(
                        width: context.width * 0.19,
                        height: context.height * 0.02,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final HomeCubit cubit;
  final int index;
  // final int id;
  const ProductWidget({
    Key? key,
    required this.cubit,
    required this.index,
    // required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: context.height * 0.3,
            width: context.width * 0.5,
            margin: EdgeInsets.only(
              top: 55.sp,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.whiteColor,
            ),
          ),
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: context.height * 0.19,
                      width: context.width * 0.43,
                      child: CachedNetworkImage(
                        imageUrl:
                            cubit.homeDataModel!.data.products[index].image,
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
                            height: context.height * 0.19,
                            width: context.width * 0.43,
                            color: AppColors.whiteColor,
                            widget: Shimmer.fromColors(
                              baseColor: Colors.grey.shade50,
                              highlightColor:
                                  AppColors.lightGrey.withOpacity(0.2),
                              child: CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                radius: 25,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: context.width * 0.43,
                child: CustomText(
                  text: cubit.homeDataModel!.data.products[index].name,
                  size: 22,
                  color: AppColors.blackColor,
                  fontWeight: AppFontWeight.semiBold,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              CustomText(
                text: 'Series 6 . Red',
                size: 16,
                color: AppColors.grey,
                fontWeight: AppFontWeight.semiBold,
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(text: 'EGP '),
                    TextSpan(
                      text:
                          '${cubit.homeDataModel!.data.products[index].price.round()} ',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (cubit.homeDataModel!.data.products[index].discount != 0)
                Text(
                  '${cubit.homeDataModel!.data.products[index].oldPrice.round()}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.lightGrey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShimmerProductWidget extends StatelessWidget {
  const ShimmerProductWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          ShimmerWidget(
            height: context.height * 0.3,
            width: context.width * 0.5,
            color: AppColors.errorColor,
            margin: const EdgeInsets.only(
              top: 60,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.whiteColor,
            ),
          ),
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(
                      height: context.height * 0.19,
                      width: context.width * 0.43,
                      color: AppColors.whiteColor,
                      widget: Shimmer.fromColors(
                        baseColor: Colors.grey.shade50,
                        highlightColor: AppColors.lightGrey.withOpacity(0.2),
                        child: CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ShimmerWidget(
                  width: context.width * 0.43,
                  height: context.height * 0.025,
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ShimmerWidget(
                  width: context.width * 0.3,
                  height: context.height * 0.015,
                ),
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ShimmerWidget(
                  height: context.height * 0.025,
                  width: context.width * 0.19,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double? height, width;
  final Color? color;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final Widget? widget;
  const ShimmerWidget({
    this.height,
    this.width,
    this.margin,
    this.decoration,
    this.widget,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: decoration,
      child: widget,
    );
  }
}
