part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
class LoginPasswordVisibilityToggled extends LoginEvent {} 
class LoginRememberMeToggled extends LoginEvent {}
class CheckAutoLogin extends LoginEvent {}