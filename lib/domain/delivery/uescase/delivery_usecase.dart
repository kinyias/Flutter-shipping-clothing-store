import 'package:shipping_clothing_store/domain/delivery/entities/delivery_response.dart';
import 'package:shipping_clothing_store/domain/delivery/repositories/delivery_repository.dart';

class DeliveryUseCase {
  final DeliveryRepository repository;

  DeliveryUseCase(this.repository);


  Future<DeliveryResponse> getDeliveriesByOrderId(int orderId) async{
    return await repository.getDeliveriesByOrderId(orderId);
  }

}