part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchOrdersEvent extends OrderEvent {
  const FetchOrdersEvent();
}

class FetchUserOrders extends OrderEvent {
  final int userId;

  const FetchUserOrders(this.userId);

  @override
  List<Object> get props => [userId];
}

class FetchOrdersByStatus extends OrderEvent {
  final String status;

  const FetchOrdersByStatus(this.status);

  @override
  List<Object> get props => [status];
}
class GetOrderDetail extends OrderEvent {
  final int orderId;

  const GetOrderDetail(this.orderId);

  @override
  List<Object> get props => [orderId];
}