
import 'package:shipping_clothing_store/data/order/sources/order_item_api.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/repositories/order_item_repository.dart';
class OrderItemRepositoryImpl implements OrderItemRepository {
  final OrderItemApi orderItemApi;

  OrderItemRepositoryImpl(this.orderItemApi);

  @override
   Future<OrderItemResponse> getOrderItemsByOrderId(int orderId) async {
    return await orderItemApi.fetchOrderItemsByOrderId(orderId);
  }

}
