import 'package:shipping_clothing_store/core/utils/local_storage/storage_utility.dart';
import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/domain/auth/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final CLocalStorage localStorage = CLocalStorage();
  LoginBloc({required this.loginUseCase}) : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginRememberMeToggled>(_onRememberMeToggled);
    on<CheckAutoLogin>(_onCheckAutoLogin);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading(
      isPasswordHidden: state.isPasswordHidden,
      isRemembered: state.isRemembered,
    ));

    try {
      final token = await loginUseCase.execute(event.email, event.password);

      if (state.isRemembered) {
        await localStorage.saveData("auth_token", token);
      }
      final UserModel user = await loginUseCase.getUser(token);
      await localStorage.saveData("userId", user.id);

      emit(LoginSuccess(
        token: token,
        isPasswordHidden: state.isPasswordHidden,
        isRemembered: state.isRemembered,
      ));
    } catch (e) {
      emit(LoginFailure(
        error: e.toString(),
        isPasswordHidden: state.isPasswordHidden,
        isRemembered: state.isRemembered,
      ));
    }
  }

  void _onPasswordVisibilityToggled(
      LoginPasswordVisibilityToggled event, Emitter<LoginState> emit) {
    emit(LoginInitial(
      isPasswordHidden: !state.isPasswordHidden,
      isRemembered: state.isRemembered,
    ));
  }

  void _onRememberMeToggled(
      LoginRememberMeToggled event, Emitter<LoginState> emit) {
    emit(LoginInitial(
      isPasswordHidden: state.isPasswordHidden,
      isRemembered: !state.isRemembered,
    ));
  }

  // 🔹 Auto Login Logic
  Future<void> _onCheckAutoLogin(
      CheckAutoLogin event, Emitter<LoginState> emit) async {
    final token = localStorage.readData<String>("auth_token");
    if (token != null) {
      emit(LoginSuccess(
        token: token,
        isPasswordHidden: state.isPasswordHidden,
        isRemembered: true,
      ));
    }
  }

  // 🔹 Logout: Clear Token
  Future<void> logout() async {
    await localStorage.deleteData("auth_token");
  }
}
