import 'package:flutter/material.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/presentation/views/delivery/widgets/delivery_list.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text('Đơn hàng cần giao',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child:
              //delivery
              DeliveryList(),
        ),
      ),
    );
  }
}