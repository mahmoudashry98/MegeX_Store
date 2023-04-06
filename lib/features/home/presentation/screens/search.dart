import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_text.dart';
import '../cubit/cubit.dart';
import 'home.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 30.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SearchWidget(
                  isKeyboardOped: false,
                  width: double.infinity,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  int val = 1;
                  return SizedBox(
                    height: context.height * 0.38,
                    child: Row(
                      children: [
                        const SearchProductWidget(),
                        const Spacer(),
                        val == 1
                            ? Container()
                            : const Padding(
                                padding: EdgeInsets.only(top: 55),
                                child: SearchProductWidget(),
                              )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: context.height * 0.25,
          width: context.width * 0.42,
          margin: const EdgeInsets.only(
            top: 60,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.grey.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  height: context.height * 0.19,
                  width: context.width * 0.33,
                  child: CachedNetworkImage(
                    imageUrl: HomeCubit.get(context)
                        .homeDataModel!
                        .data
                        .products[2]
                        .image,
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
                          highlightColor: AppColors.lightGrey.withOpacity(0.2),
                          child: CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            radius: 15,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: context.width * 0.42,
              child: CustomText(
                text:
                    HomeCubit.get(context).homeDataModel!.data.products[2].name,
                size: 22,
                color: AppColors.balckColor,
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
            CustomText(
              text:
                  '\$ ${HomeCubit.get(context).homeDataModel!.data.products[2].price}',
              size: 17,
              color: AppColors.primaryColor,
              fontWeight: AppFontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
