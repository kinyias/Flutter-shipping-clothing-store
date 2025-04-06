part of 'delivery_bloc.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object?> get props => [];
}

// Initial state
class DeliveryInitial extends DeliveryState {
  const DeliveryInitial();
}

// Loading state
class DeliveryLoading extends DeliveryState {
  const DeliveryLoading();
}

// Success state with deliveries
class DeliveryLoaded extends DeliveryState {
  final List<DeliveryModel> deliveries;

  const DeliveryLoaded(this.deliveries);

  @override
  List<Object?> get props => [deliveries];
}

// Error state
class DeliveryError extends DeliveryState {
  final String message;

  const DeliveryError(this.message);

  @override
  List<Object?> get props => [message];
}