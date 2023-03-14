
import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/caregories/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/caregories/presentation/cubit/state.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../widgets/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
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
        //var categoriesItem = CategoriesCubit.get(context).categoryModel;
        var currentIndex = cubit.currentIndex;
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            children: [
              // TabBar(tabs: tabs)
              Padding(
                padding:
                    EdgeInsets.only(top: 40.sp, left: 40.sp, bottom: 20.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(menuIcons),
                    ),
                    SizedBox(
                      width: context.width / 20,
                    ),
                    SizedBox(
                      width: context.width * 0.66,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: AppFontSize.s18,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                child: SizedBox(
                  height: 60,
                  width: context.width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          cubit.changeTabBar(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(AppMargin.m12),
                          width: context.width * 0.2,
                          height: context.height * 0.2,
                          decoration: BoxDecoration(
                              border: currentIndex == index
                                  ? Border(
                                      bottom: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 3,
                                        style: BorderStyle.solid,
                                      ),
                                    )
                                  : const Border()),
                          child: Center(
                            child: CustomText(
                              text: cubit.items[index],
                              color: currentIndex == index
                                  ? AppColors.primaryColor
                                  : AppColors.lightGrey,
                              size: AppSize.s18,
                              fontWeight: AppFontWeight.semiBold,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.items.length,
                  ),
                ),
              ),

              SizedBox(
                height: context.height / 30,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CustomText(
                      text: "Special for You",
                      size: AppFontSize.s20,
                      color: AppColors.balckColor,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                    const Spacer(),
                    CustomText(
                      text: "See more",
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
                // color: AppColors.errorColor,
                height: context.height * 0.17,
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    var categoriesCubit =
                        CategoriesCubit.get(context).categoryModel;
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        width: context.width * 0.03,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesCubit!.data.length,
                      
                      itemBuilder: (context, index) {
                       return buildSpecialOfferCard(
                          image: categoriesCubit.data[index].image,
                          category: categoriesCubit.data[index].name,
                          numOfBrands: 10,
                          press: () => {},
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
