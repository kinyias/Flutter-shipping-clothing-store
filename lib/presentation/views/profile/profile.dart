import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/presentation/views/profile/widgets/profile_menu.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';
import 'package:shipping_clothing_store/presentation/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(showBackArrow: true, title: Text('Tài khoản')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CSectionHeading(
                title: 'Thông tin tài khoản',
                showActionButton: false,
              ),
              SizedBox(
                height: CSizes.spaceBtwItems,
              ),
              
              ProfileMenu(onPressed: (){}, title: 'Tên', value: 'Admin'),
              
              const SizedBox(height: CSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: CSizes.spaceBtwItems,),

              // Heading personal info
              const CSectionHeading(title: 'Thông tin cá nhân', showActionButton: false,),
              const SizedBox(height: CSizes.spaceBtwItems,),

              ProfileMenu(onPressed: (){}, title: 'ID', value: '123', icon: Iconsax.copy,),
              ProfileMenu(onPressed: (){}, title: 'E-mail', value: 'admin@gmail.com'),
              ProfileMenu(onPressed: (){}, title: 'Số điện thoại', value: '0912345678'),
            ],
          ),
        ),
      ),
    );
  }
}
