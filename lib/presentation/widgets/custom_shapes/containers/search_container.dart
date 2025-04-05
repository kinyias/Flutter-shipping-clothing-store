import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/device/device_utility.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSearchContainer extends StatelessWidget {
  const CSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace)});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: padding,
          child: Container(
            width: CDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(CSizes.md),
            decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? CColors.dark
                      : CColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(CSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: CColors.grey) : null,
            ),
            child: Row(
              children: [
                Icon(icon, color: CColors.darkerGrey),
                const SizedBox(width: CSizes.spaceBtwItems),
                Text(text, style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          )),
    );
  }
}
