import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/constants/image_strings.dart';
class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: CColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: CSizes.iconMd,
                  height: CSizes.iconMd,
                  image: AssetImage(CImages.google)),
            )),
        const SizedBox(
          width: CSizes.spaceBtwItems,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: CColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: CSizes.iconMd,
                  height: CSizes.iconMd,
                  image: AssetImage(CImages.facebook)),
            )),
      ],
    );
  }
}