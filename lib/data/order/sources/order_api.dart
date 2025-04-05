import 'dart:convert';
import 'package:shipping_clothing_store/core/utils/http/http_client.dart';
import 'package:shipping_clothing_store/core/utils/local_storage/storage_utility.dart';
import 'package:shipping_clothing_store/data/order/models/order_item_model.dart';
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/list_order_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';

class OrderApi {
  final String token = CLocalStorage().readData('auth_token');
  // Fetch all orders
  Future<List<OrderModel>> fetchOrders() async {
    final response = await CHttpHelper.get('api/v1/orders');

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => OrderModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load orders");
    }
  }
  Future<List<OrderModel>> fetchOrdersByStatus(String status) async {
    final response = await CHttpHelper.get('api/v1/orders/status?status=$status');

   if (response.statusCode == 200) {
      return ListOrderResponse.fromJson(jsonDecode(response.body)).data;
    } else {
      throw Exception("Failed to load orders by status");
    }
  }
  Future<OrderItemResponse> fetchOrderItemsByOrderId(int orderId) async {
    final response =
        await CHttpHelper.get('api/v1/orders/$orderId/order-items');
    if (response.statusCode == 200) {
      return OrderItemResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load orders");
    }
  }

  // Fetch orders by user ID
  Future<List<OrderModel>> fetchUserOrders(int userId) async {
    final response = await CHttpHelper.get('api/v1/users/$userId/orders');

    if (response.statusCode == 200) {
      return ListOrderResponse.fromJson(jsonDecode(response.body)).data;
    } else {
      throw Exception("Failed to load user orders");
    }
  }

  // Get single order by ID
  Future<OrderModel> getOrder(int orderId) async {
    final response = await CHttpHelper.get('api/v1/orders/$orderId');

    if (response.statusCode == 200) {
      return OrderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load order details");
    }
  }
}
