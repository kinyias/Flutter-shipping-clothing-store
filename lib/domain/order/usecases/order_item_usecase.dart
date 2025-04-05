import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/repositories/order_item_repository.dart';


class OrderItemUseCase {
  final OrderItemRepository repository;

  OrderItemUseCase(this.repository);

   Future<OrderItemResponse> getOrderItemsByOrderId(int orderId)  async{
    return await repository.getOrderItemsByOrderId(orderId);
  }
}
