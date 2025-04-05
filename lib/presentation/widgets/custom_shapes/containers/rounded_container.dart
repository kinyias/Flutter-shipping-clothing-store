import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer({
    super.key,
    this.child, 
    this.width, 
    this.height,
    this.margin, 
    this.padding, 
    this.showBorder = false, 
    this.radius = CSizes.cardRadiusLg, 
    this.backgroundColor = CColors.white, 
    this.borderColor = CColors.grey,
  });

  final double? width; 
  final double? height; 
  final double radius; 
  final Widget? child; 
  final bool showBorder; 
  final Color borderColor; 
  final Color backgroundColor; 
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}