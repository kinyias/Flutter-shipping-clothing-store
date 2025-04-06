part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}
class UpdateStatusSuccess extends OrderState {}
class UpdateStatusFail extends OrderState {}

class OrderCreated extends OrderState {
  final OrderResponse response;

  const OrderCreated(this.response);

  @override
  List<Object> get props => [response];
}

class OrdersLoaded extends OrderState {
  final List<OrderModel> orders;

  const OrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrderDetailLoaded extends OrderState {
  final OrderItemResponse order;

  const OrderDetailLoaded(this.order);

  @override
  List<Object> get props => [order];
}

class OrderError extends OrderState {
  final String error;

  const OrderError(this.error);

  @override
  List<Object> get props => [error];
}