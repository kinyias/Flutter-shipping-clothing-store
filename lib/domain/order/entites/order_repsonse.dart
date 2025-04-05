import 'package:shipping_clothing_store/data/order/models/order_model.dart';

class OrderResponse {
  final bool success;
  final String message;
  final OrderModel data;

  OrderResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: OrderModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}