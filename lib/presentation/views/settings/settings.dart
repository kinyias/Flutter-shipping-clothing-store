import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/data/account/repositories/user_repositores.dart';
import 'package:shipping_clothing_store/data/account/sources/user_api.dart';
import 'package:shipping_clothing_store/domain/account/usecases/user_usecase.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/account/user_bloc.dart';
import 'package:shipping_clothing_store/presentation/views/completed/completed.dart';
import 'package:shipping_clothing_store/presentation/views/delivered/delivered.dart';
import 'package:shipping_clothing_store/presentation/views/delivery/delivery.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/get_order.dart';
import 'package:shipping_clothing_store/presentation/views/profile/profile.dart';
import 'package:shipping_clothing_store/presentation/views/settings/widgets/settings_menu_tile.dart';
import 'package:shipping_clothing_store/presentation/views/settings/widgets/user_profile_tile.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';
import 'package:shipping_clothing_store/presentation/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(
              userUseCase: UserUseCase(UserRepositoryImpl(UserApi())),
            )..add(LoadUser()),
        child: Scaffold(
            body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
          if (state is UserLoggedOut) {
            // Navigate to login screen or perform other actions
            Navigator.pushReplacementNamed(context, '/login');
          } else if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        }, builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserError) {
            return Center(
                child: Text(state.error, style: TextStyle(color: Colors.red)));
          } else if (state is UserLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      // Appbar
                      CAppBar(
                          title: Text('Tài khoản',
                              style:
                                  Theme.of(context).textTheme.headlineMedium)),
                      const SizedBox(
                        height: CSizes.spaceBtwSections,
                      ),

                      // User profile card
                      UserProfileTile(
                          user: state.user,
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                              )),
                      const SizedBox(
                        height: CSizes.spaceBtwSections,
                      ),

                      // Body
                      Padding(
                        padding: EdgeInsets.all(CSizes.defaultSpace),
                        child: Column(
                          children: [
                            // Account Settings
                            CSectionHeading(
                              title: 'Cài đặt tài khoản',
                              showActionButton: false,
                            ),
                            SizedBox(
                              height: CSizes.spaceBtwItems,
                            ),

                            SettingsMenuTile(
                                icon: Iconsax.shop,
                                title: 'Đơn hàng cần lấy',
                                subTitle: 'Danh sách đơn hàng cần lấy hàng',
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GetOrderScreen()),
                                    )),
                            SettingsMenuTile(
                                icon: Iconsax.bill,
                                title: 'Đơn hàng cần giao',
                                subTitle: 'Danh sách đơn hàng cần giao',
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryScreen()))),
                            SettingsMenuTile(
                                icon: Iconsax.bag_tick,
                                title: 'Đơn hàng đã giao',
                                subTitle: 'Danh sách đơn hàng đã giao',
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveredScreen()))),
                            SettingsMenuTile(
                                icon: Iconsax.tick_circle,
                                title: 'Đơn hàng đã hoàn thành',
                                subTitle: 'Danh sách đơn hàng đã hoàn thành',
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CompletedScreen()))),

                            //Logout button
                            const SizedBox(
                              height: CSizes.spaceBtwSections,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      side: const BorderSide(
                                          color: Colors.redAccent)),
                                  onPressed: () {
                                    context.read<UserBloc>().add(LogoutUser());
                                  },
                                  child: Text('Đăng xuất')),
                            ),
                            const SizedBox(
                              height: CSizes.spaceBtwSections * 2.5,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Có lỗi xảy ra vui lòng thử lại!'),
            );
          }
        })));
  }
}
