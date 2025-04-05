import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CCirculaIcon extends StatelessWidget {
  const CCirculaIcon({
    super.key,
    this.width,
    this.height,
    this.size = CSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : CHelperFunctions.isDarkMode(context)
                ? CColors.black.withOpacity(0.9)
                : CColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
