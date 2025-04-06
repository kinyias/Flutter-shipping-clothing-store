import 'package:shipping_clothing_store/data/delivery/models/delivery_model.dart';

class DeliveryResponse {
  final bool success;
  final String message;
  final List<DeliveryModel> data;

  DeliveryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DeliveryResponse.fromJson(Map<String, dynamic> json) {
    return DeliveryResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((item) => DeliveryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((delivery) => delivery.toJson()).toList(),
    };
  }
}