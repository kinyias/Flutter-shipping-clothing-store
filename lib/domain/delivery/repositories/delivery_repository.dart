import 'package:shipping_clothing_store/domain/delivery/entities/delivery_response.dart';

abstract class DeliveryRepository {
  Future<DeliveryResponse> getDeliveriesByOrderId(int orderId);
}