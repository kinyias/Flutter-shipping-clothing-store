
import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';
import 'package:shipping_clothing_store/domain/account/repositories/user_repository.dart';

import '../sources/user_api.dart';
class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi);

  @override
   Future<UserResponse> getUser() async {
    
    return await userApi.fetchUser();
  }
}
