
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';



abstract class OrderRepository {
  Future<List<OrderModel>> getUserOrders(int userId);
  Future<List<OrderModel>> getOrdersByStatus(String status);
  Future<OrderResponse> updateOrderPickupStatus(int orderId, String status, int userId, String imagePickup);
  Future<OrderResponse> updateOrderDeliveredStatus(int orderId, String status, String imageDelivered);
  Future<OrderItemResponse> getOrderItemsByOrderId(int orderId);
}
