import 'package:shipping_clothing_store/data/order/models/order_item_model.dart';

class OrderItemResponse {
  final bool success;
  final String message;
  final List<OrderItemModel> data;

  OrderItemResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderItemResponse.fromJson(Map<String, dynamic> json) {
    return OrderItemResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}