import 'dart:convert';

import 'package:shipping_clothing_store/core/utils/http/http_client.dart';
import 'package:shipping_clothing_store/core/utils/local_storage/storage_utility.dart';
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';
class UserApi {
  Future<UserResponse> fetchUser() async {
    final token = await CLocalStorage().readData('auth_token');
    final response = await CHttpHelper.get('api/user', token: token);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserResponse.fromJson(data);
    } else {
      throw Exception("Lỗi khi tải thông tin người dùng");
    }
  }
}
