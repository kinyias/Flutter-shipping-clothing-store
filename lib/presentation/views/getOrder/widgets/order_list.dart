import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/formatters/formatter.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/data/order/repositories/order_repository.dart';
import 'package:shipping_clothing_store/data/order/sources/order_api.dart';
import 'package:shipping_clothing_store/domain/order/usecases/order_usecase.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/order/order_bloc.dart';
import 'package:shipping_clothing_store/presentation/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return 
     BlocProvider(
        create: (context) => OrderBloc(
              orderUseCase:
                  OrderUseCase(OrderRepositoryImpl(OrderApi())),
            )..add(FetchOrdersByStatus('ordered')),
        child: 
    BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderError) {
          return Center(
              child: Text(state.error, style: TextStyle(color: Colors.red)));
        } else if (state is OrdersLoaded) {
          return ListView.separated(
              shrinkWrap: true,
              itemCount: state.orders.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final OrderModel order = state.orders[index];

                return CRoundedContainer(
                  showBorder: true,
                  padding: EdgeInsets.all(CSizes.md),
                  backgroundColor: dark ? CColors.dark : CColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          // Icon
                          Icon(Iconsax.ship),
                          SizedBox(
                            width: CSizes.spaceBtwItems / 2,
                          ),

                          // Status and date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.status,
                                  style: Theme.of(context).textTheme.bodyLarge!,
                                ),
                                Text(
                                  CFormatter.formatDate(order.createdAt),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),

                          //Icon
                          IconButton(
                              onPressed: () => Navigator.pushNamed(
                                    context,
                                    '/checkGetOrder',
                                    arguments:
                                        order,
                                  ),
                              icon: Icon(Iconsax.arrow_right_34,
                                  size: CSizes.iconSm))
                        ],
                      ),
                      const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                // Icon
                                Icon(Iconsax.tag),
                                SizedBox(
                                  width: CSizes.spaceBtwItems / 2,
                                ),

                                // Status and date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Đơn hàng',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        '#${order.id}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                // Icon
                                Icon(Iconsax.calendar),
                                SizedBox(
                                  width: CSizes.spaceBtwItems / 2,
                                ),

                                // Status and date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ngày giao hàng',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        CFormatter.formatDate(
                                            order.deliveredDate),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              });
        }
        return const SizedBox.shrink();
      },
    )
  );}
}
