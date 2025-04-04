
import 'package:shipping_clothing_store/core/utils/local_storage/storage_utility.dart';
import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase(this.repository);

   Future<UserModel> getUser() async {
    final UserResponse user = await repository.getUser();
    return user.data;
  }
   Future<bool> logout() async {
    await CLocalStorage().deleteData('auth_token');
    await CLocalStorage().deleteData('userId');
    return true;
  }
}
