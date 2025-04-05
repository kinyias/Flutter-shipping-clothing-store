import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/domain/account/usecases/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  UserBloc({required this.userUseCase}) : super(UserLoading()) {
    on<LoadUser>(_onLoadUser);
     on<LogoutUser>(_onLogoutUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final UserModel user = await userUseCase.getUser();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError("Lỗi: ${e.toString()}"));
    }
  }
   Future<void> _onLogoutUser(LogoutUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    
    try {
      await userUseCase.logout(); 
      emit(UserLoggedOut());
    } catch (e) {
      emit(UserError("Lỗi khi đăng xuất: ${e.toString()}"));
    }
  }
}
