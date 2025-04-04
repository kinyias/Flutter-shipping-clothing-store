
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';

import '../entities/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> signup(String email, String password, String passwordConfirmation, String name, String mobile);
  Future<UserResponse> getUser(String token);
}
