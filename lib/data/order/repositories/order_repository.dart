import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';

import '../../../domain/order/repositories/order_repository.dart';
import '../sources/order_api.dart';
class OrderRepositoryImpl implements OrderRepository {
  final OrderApi orderApi;

  OrderRepositoryImpl(this.orderApi);

   @override
   Future<List<OrderModel>> getUserOrders(int userId) async {
    return await orderApi.fetchUserOrders(userId);
  }
   @override
   Future<List<OrderModel>> getOrdersByStatus(String status) async {
    return await orderApi.fetchOrdersByStatus(status);
  }
   @override
  Future<OrderResponse> updateOrderPickupStatus(int orderId, String status, int userId, String imagePickup) async {
    return await orderApi.updateOrderPickupStatus(orderId, status, userId, imagePickup);
  }
   @override
  Future<OrderResponse> updateOrderDeliveredStatus(int orderId, String status, String imageDelivered) async {
    return await orderApi.updateOrderDeliveredStatus(orderId, status, imageDelivered);
  }
   @override
   Future<OrderItemResponse> getOrderItemsByOrderId(int orderId) async {
    return await orderApi.fetchOrderItemsByOrderId(orderId);
  }
}
