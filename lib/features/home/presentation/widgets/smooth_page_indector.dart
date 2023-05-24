import 'package:flutter/material.dart';

class SmoothPageIndicator extends StatelessWidget {
  final int count;
  final double activeIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final double spacing;

  const SmoothPageIndicator({
    Key? key,
    required this.count,
    required this.activeIndex,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.size = 10.0,
    this.spacing = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex.floor();
        final color = isActive ? activeColor : inactiveColor;
        final bulletSize = isActive ? size * 1.5 : size;

        return Container(
          width: bulletSize,
          height: size,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(bulletSize / 2),
          ),
        );
      }),
    );
  }
}
