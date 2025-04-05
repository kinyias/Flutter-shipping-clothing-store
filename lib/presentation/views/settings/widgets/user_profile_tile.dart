
import 'package:shipping_clothing_store/core/constants/image_strings.dart';
import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/presentation/widgets/images/c_circular_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.user,
    required this.onPressed
  });
  final UserModel user;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CCircularImage(image: CImages.user),
      title: Text(user.name, style: Theme.of(context).textTheme.headlineSmall,),
      subtitle: Text(user.email, style: Theme.of(context).textTheme.bodyMedium,),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit)),
    );
  }
}