import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/formatters/formatter.dart';
import 'package:shipping_clothing_store/data/address/models/address_model.dart';
import 'package:shipping_clothing_store/data/delivery/repositories/delivery_repository.dart';
import 'package:shipping_clothing_store/data/delivery/sources/delivery_api.dart';
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/data/order/repositories/order_repository.dart';
import 'package:shipping_clothing_store/data/order/sources/order_api.dart';
import 'package:shipping_clothing_store/domain/delivery/uescase/delivery_usecase.dart';
import 'package:shipping_clothing_store/domain/order/usecases/order_usecase.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/delivery/delivery_bloc.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/order/order_bloc.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/widgets/address_section.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/widgets/order_items.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';
import 'package:shipping_clothing_store/presentation/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shipping_clothing_store/presentation/widgets/images/c_rounded_image.dart';
import 'package:shipping_clothing_store/presentation/widgets/texts/section_heading.dart';

class DeliveredDetailScreen extends StatefulWidget {
  const DeliveredDetailScreen({super.key, required this.order});
  final OrderModel order;

  @override
  State<DeliveredDetailScreen> createState() => _DeliveredDetailScreenState();
}

class _DeliveredDetailScreenState extends State<DeliveredDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(
        orderUseCase: OrderUseCase(OrderRepositoryImpl(OrderApi())),
      )..add(GetOrderDetail(widget.order.id)),
      child: Scaffold(
        appBar: CAppBar(
          showBackArrow: true,
          title: Text('Chi tiết đơn hàng đã giao',
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
                    if (state is OrderLoading &&
                        state is! UpdateStatusSuccess) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is OrderError) {
                      return Center(
                        child: Text(state.error,
                            style: TextStyle(color: Colors.red)),
                      );
                    } else if (state is OrderDetailLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderItems(orderItems: state.order.data),
                          SizedBox(
                            height: CSizes.spaceBtwItems,
                          ),
                          Text(
                            "Đã thanh toán: ${CFormatter.formatCurrency(widget.order.total)}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: CSizes.spaceBtwSections),
                          BlocProvider(
                            create: (context) => DeliveryBloc(
                              deliveryUseCase: DeliveryUseCase(
                                  DeliveryRepositoryImpl(DeliveryApi())),
                            )..add(FetchDeliveriesByOrderId(widget.order.id)),
                            child: BlocBuilder<DeliveryBloc, DeliveryState>(
                              builder: (context, state) {
                                if (state is DeliveryLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is DeliveryLoaded) {
                                  final delivery = state.deliveries[0];
                                  return Column(
                                    children: [
                                      CSectionHeading(
                                        title: 'Hình ảnh lấy hàng',
                                        showActionButton: false,
                                      ),
                                      SizedBox(height: CSizes.spaceBtwItems),
                                      CRoundedImage(
                                        imageUrl: delivery.imagePickup!,
                                        applyImageRadius: true,
                                      ),
                                      CSectionHeading(
                                        title: 'Hình ảnh giao hàng',
                                        showActionButton: false,
                                      ),
                                      SizedBox(height: CSizes.spaceBtwItems),
                                      CRoundedImage(
                                        imageUrl: delivery.imageDelivered!,
                                        applyImageRadius: true,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  );
                                } else if (state is DeliveryError) {
                                  return Center(
                                      child: Text(
                                          'Error: Lỗi tải chi tiết giao hàng'));
                                }
                                return const Center(child: Text('Trống'));
                              },
                            ),
                          )
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
      ),
    );
  }
}
