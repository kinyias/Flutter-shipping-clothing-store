import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:shipping_clothing_store/data/address/models/address_model.dart';
import 'package:shipping_clothing_store/presentation/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.address});
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return CRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: Colors.transparent,
      borderColor: dark
              ? Colors.grey[800]!
              : Colors.grey[300]!,
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
      child: InkWell(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: CSizes.sm / 2),
                Text(
                  address.phone,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: CSizes.sm / 2),
                Text(
                 '${address.address}, ${address.locality}, ${address.state}, ${address.city}',
                  softWrap: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}