import 'dart:io';

import 'package:shipping_clothing_store/data/delivery/models/delivery_model.dart';
import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/delivery/uescase/delivery_usecase.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';
import 'package:shipping_clothing_store/domain/order/usecases/order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';
class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final DeliveryUseCase deliveryUseCase;
  DeliveryBloc({required this.deliveryUseCase}) : super(const DeliveryInitial()) {
    on<FetchDeliveriesByOrderId>(_onFetchDeliveriesByOrderId);
  }

  Future<void> _onFetchDeliveriesByOrderId(
    FetchDeliveriesByOrderId event,
    Emitter<DeliveryState> emit,
  ) async {
    emit(const DeliveryLoading());
    try {
        final deliveryResponse = await deliveryUseCase.getDeliveriesByOrderId(event.orderId);
        if (deliveryResponse.success) {
          emit(DeliveryLoaded(deliveryResponse.data));
        } else {
          emit(DeliveryError(deliveryResponse.message));
        }
    
    } catch (e) {
      emit(DeliveryError('Error fetching deliveries: $e'));
    }
  }
}