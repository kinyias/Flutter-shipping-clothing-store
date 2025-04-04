import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/data/auth/models/auth_model.dart';
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';

import '../../../domain/auth/repositories/auth_repository.dart';
import '../sources/auth_api.dart';
import '../../../domain/auth/entities/auth_response.dart';
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<AuthResponse> login(String email, String password) async {
    final AuthModel authModel = await authApi.login(email, password);
    return AuthResponse(token: authModel.token);
  }

   @override
  Future<AuthResponse> signup(String email, String password, String passwordConfirmation, String name, String mobile) async {
    final AuthModel authModel = await authApi.signup(email, password, passwordConfirmation, name, mobile);
    return AuthResponse(token: authModel.token);
  }

 @override
   Future<UserResponse> getUser(String token) async {
    return await authApi.fetchUser(token);
  }
}
