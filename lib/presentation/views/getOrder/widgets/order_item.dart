import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:shipping_clothing_store/data/order/models/order_item_model.dart';
import 'package:shipping_clothing_store/presentation/widgets/images/c_rounded_image.dart';
import 'package:shipping_clothing_store/presentation/widgets/texts/product_title_text.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderItem});
  final OrderItemModel orderItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: 
                  CProductTitleText(
                    title: orderItem.product!.name,
                    maxLines: 1,
                  ),),
                    Text('x${orderItem.quantity.toString()}'),
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}
