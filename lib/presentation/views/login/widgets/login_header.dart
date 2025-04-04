import 'package:shipping_clothing_store/core/constants/image_strings.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/localization/app_localization.dart';
import 'package:flutter/material.dart';
class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 150, image: AssetImage(CImages.appLogo)),
        Text(AppLocalizations.of(context)!.translate('loginTitle'),
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(
          height: CSizes.sm,
        ),
        Text(AppLocalizations.of(context)!.translate('loginSubTitle'),
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}