import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

Widget buildSpecialOfferCard({
  required final String category,
  required final String image,
  required final int numOfBrands,
  required final GestureTapCallback press,
}) =>
    SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: press,
          child: Row(
            children: [
              // Column(
              //   children: [
              //     Shimmer(
              //       height: 140,
              //       width: 100,
              //       color: Colors.black.withOpacity(0.04),
              //     ),
              //     Column(
              //       children: [
              //         Shimmer(
              //           height: 40,
              //           width: 50,
              //           color: AppColors.errorColor,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: '$category\n',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: '$numOfBrands Brands'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

class Shimmer extends StatelessWidget {
  double? height;
  double? width;
  Color? color;
  Shimmer({Key? key, this.height, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
    );
  }
}
