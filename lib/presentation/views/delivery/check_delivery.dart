import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/formatters/formatter.dart';
import 'package:shipping_clothing_store/core/utils/local_storage/storage_utility.dart';
import 'package:shipping_clothing_store/core/utils/popups/loaders.dart';
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

class CheckDeliveryScreen extends StatefulWidget {
  const CheckDeliveryScreen({super.key, required this.order});
  final OrderModel order;

  @override
  State<CheckDeliveryScreen> createState() => _CheckDeliveryScreenState();
}

class _CheckDeliveryScreenState extends State<CheckDeliveryScreen> {
  File? _selectedImage;

  Future<void> _pickOrCaptureImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Chụp hình'),
                onTap: () {
                  Navigator.pop(context);
                  _captureImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Chọn ảnh từ thư viện'),
                onTap: () {
                  Navigator.pop(context);
                  _captureImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _captureImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(
        orderUseCase: OrderUseCase(OrderRepositoryImpl(OrderApi())),
      )..add(GetOrderDetail(widget.order.id)),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is UpdateStatusSuccess) {
            // Show success message and navigate back with refresh flag
            Loaders.sucessToast(message: "Xác nhận giao hàng thành công", context: context);
            Navigator.of(context).pop(true); // Pass true to indicate successful update
          } else if (state is OrderError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Scaffold(
          appBar: CAppBar(
            showBackArrow: true,
            title: Text('Xác nhận đã giao hàng',
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
                      userId: widget.order.userId,
                      name: widget.order.name,
                      phone: widget.order.phone,
                      locality: widget.order.locality,
                      address: widget.order.address,
                      city: widget.order.city,
                      state: widget.order.state,
                      zip: widget.order.zip,
                    ),
                  ),
                  CSectionHeading(
                    title: 'Chi tiết kiện hàng',
                    showActionButton: false,
                  ),
                  SizedBox(height: CSizes.spaceBtwItems / 2),
                  BlocBuilder<OrderBloc, OrderState>(
                    builder: (context, state) {
                      if (state is OrderLoading && state is! UpdateStatusSuccess) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is OrderError) {
                        return Center(
                          child: Text(state.error, style: TextStyle(color: Colors.red)),
                        );
                      } else if (state is OrderDetailLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrderItems(orderItems: state.order.data),
                            SizedBox(height: CSizes.spaceBtwItems,),
                            Text("Cần thanh toán: ${CFormatter.formatCurrency(widget.order.total)}", style: Theme.of(context).textTheme.titleLarge,),
                            SizedBox(height: CSizes.spaceBtwSections),
                            CSectionHeading(
                              title: 'Xác nhận hình ảnh',
                              showActionButton: false,
                            ),
                            SizedBox(height: CSizes.spaceBtwItems),
                            GestureDetector(
                              onTap: () => _pickOrCaptureImage(context),
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(CSizes.cardRadiusLg),
                                ),
                                child: _selectedImage == null
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                                          SizedBox(height: CSizes.spaceBtwItems),
                                          Text(
                                            'Chụp hoặc tải lên hình ảnh xác nhận',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ],
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(CSizes.cardRadiusLg),
                                        child: Image.file(
                                          _selectedImage!,
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(CSizes.defaultSpace),
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: _selectedImage == null || state is OrderLoading
                      ? null
                      : () {
                          context.read<OrderBloc>().add(
                            UpdateDeliveredOrder(_selectedImage!, widget.order.id),
                          );
                        },
                  child: state is OrderLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Xác nhận đã lấy hàng'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}