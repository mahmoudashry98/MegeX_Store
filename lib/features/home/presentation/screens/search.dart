import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/custom_text.dart';
import '../cubit/cubit.dart';
import 'home.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          bool isSearching = true;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 30.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    SearchWidget(
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          cubit.searchProducts(searchController.text);
                        }
                        cubit.isSearching(isSearching);
                      },
                      textEditingController: searchController,
                      isKeyboardOped: false,
                      width: double.infinity,
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                searchController.text.isEmpty
                    ? const NotFoundWidget()
                    : Center(
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return CustomText(
                              text:
                                  'Found  ${searchController.text.isEmpty ? '0' : cubit.searchResults.length} results',
                              color: AppColors.balckColor,
                              fontWeight: AppFontWeight.semiBold,
                              size: AppFontSize.s28,
                            );
                          },
                        ),
                      ),
                SearchProductWidget(
                  cubit: cubit,
                  searchController: searchController,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(notFoundImage),
          CustomText(
            text: 'Item not found',
            color: AppColors.balckColor,
            fontWeight: AppFontWeight.semiBold,
            size: AppFontSize.s28,
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          CustomText(
            textAlign: TextAlign.center,
            text:
                'Try a more generic search term or try\n looking for alternative products.',
            color: AppColors.balckColor,
            fontWeight: AppFontWeight.regular,
            size: AppFontSize.s17,
          ),
        ],
      ),
    );
  }
}

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({
    Key? key,
    required this.cubit,
    required this.searchController,
  }) : super(key: key);

  final HomeCubit cubit;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: cubit.searchResults.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return searchController.text.isEmpty
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height * 0.38,
                    child: Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Container(
                              height: context.height * 0.25,
                              width: context.width * 0.4,
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
                                        imageUrl:
                                            cubit.searchResults[index].image,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
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
                                              highlightColor: AppColors
                                                  .lightGrey
                                                  .withOpacity(0.2),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.whiteColor,
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
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10.sp, right: 10.sp),
                                  width: context.width * 0.42,
                                  child: CustomText(
                                    text: cubit.searchResults[index].name,
                                    size: 18,
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
                                      '\$ ${cubit.searchResults[index].price}',
                                  size: 17,
                                  color: AppColors.primaryColor,
                                  fontWeight: AppFontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    ));
  }
}
