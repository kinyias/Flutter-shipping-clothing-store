import 'package:shipping_clothing_store/presentation/widgets/texts/c_brand_title_text.dart';
import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/sizes.dart';

class CBrandTitleWithVerifiedIcon extends StatelessWidget {
  const CBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: CSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: CSizes.iconXs),
      ],
    );
  }
}
