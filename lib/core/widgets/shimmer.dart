import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {
  buildBasicShimmer({
    double height = double.infinity,
    double width = double.infinity,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade50,
      highlightColor: Colors.grey.shade200,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

  buildListShimmer({
    required itemCount,
    required itemHeight,
  }) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: ShimmerHelper().buildBasicShimmer(height: itemHeight),
        );
      },
    );
  }

  buildProductGridShimmer({
    required scontroller,
    required itemCount,
  }) {
    return ListView.builder(
      // 2
      //addAutomaticKeepAlives: true,
      itemCount: itemCount,
      controller: scontroller,
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemExtent: 220,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade50,
            highlightColor: Colors.grey.shade200,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  buildSquareGridShimmer({
    required scontroller,
    required itemCount,
  }) {
    return GridView.builder(
      itemCount: itemCount,
      controller: scontroller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade50,
            highlightColor: Colors.grey.shade200,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
