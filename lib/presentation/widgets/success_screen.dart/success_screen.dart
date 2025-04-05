import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/presentation/styles/spacing_styles.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});
  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: CSpacingStyle.paddingWithAppBarHeight*2,
        child: Column(
          children: [
            //Image
            Image(image: AssetImage(image), width: 100,),
            const SizedBox(height: CSizes.spaceBtwSections,),

            //Title & subtitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: CSizes.spaceBtwItems,),
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: CSizes.spaceBtwItems,),

            //Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: onPressed, child: const Text('Quay lại')),
            )
          ],
        ),),
      ),
    );
  }
}
