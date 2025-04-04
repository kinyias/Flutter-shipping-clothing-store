

import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';

import '../repositories/auth_repository.dart';
import '../entities/auth_response.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

   Future<String> execute(String email, String password) async {
    final AuthResponse response = await repository.login(email, password);
    return response.token;
  }
   Future<UserModel> getUser(String token) async {
    final UserResponse user = await repository.getUser(token);
    return user.data;
  }
}
