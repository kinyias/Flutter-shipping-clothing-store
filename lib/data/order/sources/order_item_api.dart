import 'dart:convert';

import 'package:shipping_clothing_store/core/utils/http/http_client.dart';
import 'package:shipping_clothing_store/core/utils/local_storage/storage_utility.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';

class OrderItemApi {
  final String token = CLocalStorage().readData('auth_token');
  // Fetch all orders
  Future<OrderItemResponse> fetchOrderItemsByOrderId(int orderId) async {
    final response = await CHttpHelper.get('api/v1/orders/$orderId/order-items');

    if (response.statusCode == 200) {
      return  OrderItemResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load orders");
    }
  }
}