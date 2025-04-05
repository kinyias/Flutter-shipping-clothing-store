import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/utils/device/device_utility.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? CColors.black : CColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CColors.primary,
        labelColor: dark ? CColors.white : CColors.primary,
        unselectedLabelColor: CColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
