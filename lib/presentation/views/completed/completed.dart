import 'package:flutter/material.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/presentation/views/completed/widgets/completed_list.dart';
import 'package:shipping_clothing_store/presentation/views/delivery/widgets/delivery_list.dart';
import 'package:shipping_clothing_store/presentation/widgets/appbar/appbar.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        title: Text('Đơn hàng đã hoàn thành',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child:
              //delivery
              CompletedList(),
        ),
      ),
    );
  }
}