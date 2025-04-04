part of 'login_bloc.dart';

abstract class LoginState {
  final bool isPasswordHidden;
  final bool isRemembered;
  const LoginState({this.isPasswordHidden = true, this.isRemembered = false});
}

class LoginInitial extends LoginState {
  const LoginInitial({bool isPasswordHidden = true, bool isRemembered = false})
      : super(isPasswordHidden: isPasswordHidden, isRemembered: isRemembered);
}

class LoginLoading extends LoginState {
  const LoginLoading({bool isPasswordHidden = true, bool isRemembered = false})
      : super(isPasswordHidden: isPasswordHidden, isRemembered: isRemembered);
}

class LoginSuccess extends LoginState {
  final String token;
  const LoginSuccess(
      {required this.token,
      bool isPasswordHidden = true,
      bool isRemembered = false})
      : super(isPasswordHidden: isPasswordHidden, isRemembered: isRemembered);
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(
      {required this.error,
      bool isPasswordHidden = true,
      bool isRemembered = false})
      : super(isPasswordHidden: isPasswordHidden, isRemembered: isRemembered);
}
