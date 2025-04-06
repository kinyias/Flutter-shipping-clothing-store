import 'package:shipping_clothing_store/data/delivery/sources/delivery_api.dart';
import 'package:shipping_clothing_store/domain/delivery/entities/delivery_response.dart';
import 'package:shipping_clothing_store/domain/delivery/repositories/delivery_repository.dart';

class DeliveryRepositoryImpl  implements DeliveryRepository {
  final DeliveryApi deliveryApi;

  DeliveryRepositoryImpl (this.deliveryApi);

   @override
   Future<DeliveryResponse> getDeliveriesByOrderId(int orderId) async {
    return await deliveryApi.getDeliveriesByOrderId(orderId);
  }
}