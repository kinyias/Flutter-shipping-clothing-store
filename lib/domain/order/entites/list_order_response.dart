import 'package:shipping_clothing_store/data/order/models/order_model.dart';

class ListOrderResponse {
  final bool success;
  final String message;
  final List<OrderModel> data;

  ListOrderResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ListOrderResponse.fromJson(Map<String, dynamic> json) {
    return ListOrderResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List)
          .map((orderJson) => OrderModel.fromJson(orderJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((order) => order.toJson()).toList(),
    };
  }
}