// bloc/order_bloc.dart
import 'dart:io';

import 'package:shipping_clothing_store/data/order/models/order_model.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_item_response.dart';
import 'package:shipping_clothing_store/domain/order/entites/order_repsonse.dart';
import 'package:shipping_clothing_store/domain/order/usecases/order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderUseCase orderUseCase;

  OrderBloc({required this.orderUseCase}) : super(OrderInitial()) {
    on<FetchOrdersEvent>(_onFetchOrders);
    on<FetchOrdersByStatus>(_onFetchOrdersByStatus);
    on<UpdatePickupOrder>(_onUpdatePickupOrder);
    on<UpdateDeliveredOrder>(_onUpdateDeliveredOrder);
    on<FetchUserOrders>(_onFetchUserOrders);
    on<GetOrderDetail>(_onGetOrderDetails);
  }


  Future<void> _onFetchOrders(
    FetchOrdersEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      // final orders = await orderUseCase.fetchOrders();
      // emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onFetchUserOrders(
    FetchUserOrders event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final orders = await orderUseCase.getUserOrders(event.userId);
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
Future<void> _onUpdatePickupOrder(
    UpdatePickupOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      String? imageUrl = await orderUseCase.uploadImageToCloudinary(event.imageFile);
      OrderResponse orderResponse = await orderUseCase.updateOrderPickupStatus(event.orderId, 'pickup', event.userId, imageUrl!);
      if(orderResponse.success){
      emit(UpdateStatusSuccess());
      }
      else{
         emit(UpdateStatusFail());
      }
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
  Future<void> _onUpdateDeliveredOrder(
    UpdateDeliveredOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      String? imageUrl = await orderUseCase.uploadImageToCloudinary(event.imageFile);
      OrderResponse orderResponse = await orderUseCase.updateOrderDeliveredStatus(event.orderId, 'delivered', imageUrl!);
      if(orderResponse.success){
      emit(UpdateStatusSuccess());
      }
      else{
         emit(UpdateStatusFail());
      }
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
  Future<void> _onFetchOrdersByStatus(
    FetchOrdersByStatus event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final orders = await orderUseCase.getOrdersByStatus(event.status);
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> _onGetOrderDetails(
    GetOrderDetail event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final orderItemsResponse =
          await orderUseCase.getOrderItemsByOrderId(event.orderId);
      emit(OrderDetailLoaded(orderItemsResponse));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
