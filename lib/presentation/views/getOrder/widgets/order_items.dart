import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/data/order/models/order_item_model.dart';
import 'package:shipping_clothing_store/presentation/widgets/texts/product_price_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_item.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key, required this.orderItems});
  final List<OrderItemModel> orderItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(orderItems.length, (index) {
        final OrderItemModel orderItem = orderItems[index];
        return Column(
          children: [
            OrderItem(orderItem: orderItem),
            const SizedBox(height: CSizes.spaceBtwItems),
            if (index < 9) const SizedBox(height: CSizes.spaceBtwSections),
          ],
        );
      }),
    );
  }
}
