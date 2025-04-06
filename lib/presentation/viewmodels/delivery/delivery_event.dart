part of 'delivery_bloc.dart';
abstract class DeliveryEvent {
  const DeliveryEvent();
}

// Event to fetch deliveries by order ID
class FetchDeliveriesByOrderId extends DeliveryEvent {
  final int orderId;

  const FetchDeliveriesByOrderId(this.orderId);
}