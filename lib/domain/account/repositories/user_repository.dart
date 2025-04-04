
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';

abstract class UserRepository {
  Future<UserResponse> getUser();
}
