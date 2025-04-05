import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';

abstract class OrderItemRepository {
  Future<OrderItemResponse> getOrderItemsByOrderId(int orderId);
}