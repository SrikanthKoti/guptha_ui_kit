import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GkShimmer extends StatelessWidget {
  final double? width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;

  const GkShimmer(
      {super.key,
      this.width = 100,
      this.height = 100,
      this.borderRadius,
      this.padding,
      this.margin,
      this.baseColor,
      this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFFF5F5F5),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
