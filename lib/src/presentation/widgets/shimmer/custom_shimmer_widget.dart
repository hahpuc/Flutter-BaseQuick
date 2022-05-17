import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RectangleShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? loadingColor;

  const RectangleShimmer({
    Key? key,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.loadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      enabled: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: loadingColor ?? Colors.grey,
        ),
      ),
    );
  }
}

class CircleShimmer extends StatelessWidget {
  final double radius;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? loadingColor;

  const CircleShimmer({
    Key? key,
    this.shape = BoxShape.circle,
    this.borderRadius,
    this.radius = 28,
    this.baseColor,
    this.highlightColor,
    this.loadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      enabled: true,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: loadingColor ?? Colors.grey,
        ),
      ),
    );
  }
}
