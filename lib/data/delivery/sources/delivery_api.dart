import 'dart:convert';

import 'package:shipping_clothing_store/core/utils/http/http_client.dart';
import 'package:shipping_clothing_store/domain/delivery/entities/delivery_response.dart';
class DeliveryApi {  
Future<DeliveryResponse> getDeliveriesByOrderId(int orderId) async {
  try {
   
    final response = await CHttpHelper.get('api/v1/deliveries/order/$orderId');

    print('Response: ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      return DeliveryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch deliveries: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}
}