
import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:shipping_clothing_store/core/utils/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shipping_clothing_store/presentation/views/delivery/delivery.dart';
import 'package:shipping_clothing_store/presentation/views/delivery/widgets/delivery_list.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/get_order.dart';
import 'package:shipping_clothing_store/presentation/views/settings/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = CHelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              backgroundColor: darkMode ? CColors.black : CColors.white,
              indicatorColor: darkMode
                  ? CColors.white.withOpacity(0.1)
                  : CColors.black.withOpacity(0.1),
              destinations: [
                NavigationDestination(
                  icon: Icon(Iconsax.shop),
                  label: 'Đơn cần lấy',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.bill),
                  label: "Đang giao",
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user),
                  label: AppLocalizations.of(context)!.translate('Tôi'),
                ),
              ]),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const GetOrderScreen(),
    const DeliveryScreen(),
    const SettingsScreen(),
    // const HomeScreen(),
    // const StoreScreen(),
    // const FavouriteScreen(),
    // const SettingsScreen(),
  ];
}
