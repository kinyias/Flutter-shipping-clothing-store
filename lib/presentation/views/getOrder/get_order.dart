import 'package:flutter/material.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';
import 'package:shipping_clothing_store/presentation/views/getOrder/widgets/order_list.dart';

class GetOrderScreen extends StatelessWidget {
  const GetOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text('Đơn hàng cần lấy',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child:
              //Orders
              OrderList(),
        ),
      ),
    );
  }
}
