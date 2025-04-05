import 'dart:convert';


import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import '../repositories/order_repository.dart';

class OrderUseCase {
  final OrderRepository repository;

  OrderUseCase(this.repository);


  Future<List<OrderModel>> getUserOrders(int userId) async {
    return await repository.getUserOrders(userId);
  }

  Future<List<OrderModel>> getOrdersByStatus(String status) async {
    return await repository.getOrdersByStatus(status);
  }

  Future<OrderItemResponse> getOrderItemsByOrderId(int orderId) async {
    return await repository.getOrderItemsByOrderId(orderId);
  }
}
