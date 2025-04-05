import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class CVerticalImageText extends StatelessWidget {
  const CVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = CColors.white,
    this.backgroundColor = CColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(CSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? CColors.black : CColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  // color: dark ? CColors.light : CColors.dark,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons
                        .error); // Display an error icon if the image fails to load
                  },
                ),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: 
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              )
            )
          ],
        ),
      ),
    );
  }
}
