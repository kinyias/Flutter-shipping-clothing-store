import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';
import '../repositories/order_repository.dart';
import 'package:http/http.dart' as http;
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
  Future<OrderResponse> updateOrderPickupStatus(int orderId, String status, int userId, String imagePickup) async{
     return await repository.updateOrderPickupStatus(orderId, status, userId, imagePickup);
  }
  Future<OrderResponse> updateOrderDeliveredStatus(int orderId, String status, String imageDelivered) async{
     return await repository.updateOrderDeliveredStatus(orderId, status, imageDelivered);
  }
  Future<String?> uploadImageToCloudinary(File imageFile) async {
    const String cloudName = 'ddmqtxja3';
    const String apiKey = '419339974774222';
    const String uploadPreset =
        'clothingstore'; 

    final Uri uri = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset 
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          contentType:
              MediaType('image', 'jpeg'),
        ),
      );

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseData);
        return jsonResponse[
            'secure_url']; // Return the secure URL of the uploaded image
      } else {
        print('Failed to upload image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

}
