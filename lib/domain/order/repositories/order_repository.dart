
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';



abstract class OrderRepository {
  Future<List<OrderModel>> getUserOrders(int userId);
  Future<List<OrderModel>> getOrdersByStatus(String status);
  Future<OrderItemResponse> getOrderItemsByOrderId(int orderId);
  // Future<OrderResponse> getOrder(OrderModel order);
  // Future<OrderResponse> getAllOrder(OrderModel order);
}
