import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/data/address/models/address_model.dart';
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/data/order/repositories/order_repository.dart';
import 'package:shipping_clothing_store/data/order/sources/order_api.dart';
import 'package:shipping_clothing_store/domain/order/usecases/order_usecase.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/order/order_bloc.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/widgets/address_section.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/widgets/order_items.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';
import 'package:shipping_clothing_store/presentation/widgets/texts/section_heading.dart';

class CheckGetOrderScreen extends StatelessWidget {
  const CheckGetOrderScreen({super.key, required this.order});
  final OrderModel order;

  Future<void> _pickOrCaptureImage(BuildContext context) async {
    // You'll need to implement image picking/capture logic here
    // This is just a placeholder for the functionality
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement camera capture
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement gallery picker
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        title: Text('Xác nhận lấy hàng',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CSectionHeading(
                title: 'Địa chỉ giao hàng',
                showActionButton: false,
              ),
              SizedBox(height: CSizes.spaceBtwItems / 2),
              AddressSection(
                address: AddressModel(
                  id: '1',
                  userId: order.userId,
                  name: order.name,
                  phone: order.phone,
                  locality: order.locality,
                  address: order.address,
                  city: order.city,
                  state: order.state,
                  zip: order.zip,
                ),
              ),
              SizedBox(height: CSizes.spaceBtwSections),
              CSectionHeading(
                title: 'Chi tiết kiện hàng',
                showActionButton: false,
              ),
              SizedBox(height: CSizes.spaceBtwItems / 2),
              BlocProvider(
                create: (context) => OrderBloc(
                  orderUseCase: OrderUseCase(OrderRepositoryImpl(OrderApi())),
                )..add(GetOrderDetail(order.id)),
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is OrderLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is OrderError) {
                      return Center(
                        child: Text(state.error, style: TextStyle(color: Colors.red)),
                      );
                    } else if (state is OrderDetailLoaded) {
                      return Column(
                        children: [
                          OrderItems(orderItems: state.order.data),
                          SizedBox(height: CSizes.spaceBtwSections),
                          // Image capture/upload section
                          CSectionHeading(
                            title: 'Xác nhận hình ảnh',
                            showActionButton: false,
                          ),
                          SizedBox(height: CSizes.spaceBtwItems),
                          GestureDetector(
                            onTap: () => _pickOrCaptureImage(context),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(CSizes.cardRadiusLg),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                                  SizedBox(height: CSizes.spaceBtwItems),
                                  Text(
                                    'Chụp hoặc tải lên hình ảnh xác nhận',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // You might want to display the selected image here
                          // if you store it in state
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            // Handle order confirmation with image
          },
          child: const Text('Xác nhận đã lấy hàng'),
        ),
      ),
    );
  }
}