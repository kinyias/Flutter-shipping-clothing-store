import 'dart:convert';
import 'package:shipping_clothing_store/core/utils/http/http_client.dart';
import 'package:shipping_clothing_store/core/utils/http/network_manager.dart';
import 'package:shipping_clothing_store/data/account/models/user_model.dart';
import 'package:shipping_clothing_store/data/auth/models/auth_model.dart';
import 'package:shipping_clothing_store/domain/account/entities/user_response.dart';

class AuthApi {
  Future<AuthModel> login(String email, String password) async {
    final response = await CHttpHelper.post(
        'api/login', {'email': email, 'password': password});

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return AuthModel.fromJson(data);
    } else if (response.statusCode == 401) {
      // Unauthorized - Wrong username or password
      throw Exception("Sai email hoặc mật khẩu");
    } else if (response.statusCode >= 500) {
      // Internal Server Error
      throw Exception("Máy chủ xảy ra lỗi, vui lòng thử lại.");
    } else {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected)
        throw Exception("Không có kết nối internet, vui lòng thử lại.");
      throw Exception("Có lỗi xảy ra, vui lòng thử lại.");
    }
  }

  Future<AuthModel> signup(String email, String password,
      String passwordConfirmation, String name, String mobile) async {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      throw Exception("Không có kết nối internet, vui lòng thử lại.");
    }
    
    try {
      final response = await CHttpHelper.post('api/register', {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'name': name,
        'mobile': mobile
      });

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return AuthModel.fromJson(data);
      } else if (response.statusCode == 422) {
        // 🔹 Handle Email or Phone Already Used
        throw Exception("Email hoặc số điện thoại đã được sử dụng");
      } else if (response.statusCode >= 500) {
        // 🔹 Handle Server Error
        throw Exception("Máy chủ xảy ra lỗi, vui lòng thử lại.");
      } else {
        // 🔹 Handle Unexpected Errors
        final Map<String, dynamic> data = jsonDecode(response.body);
        String errorMessage =
            data['message'] ?? "Có lỗi xảy ra, vui lòng thử lại.";
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserResponse> fetchUser(String token) async {
    final response = await CHttpHelper.get('api/user', token: token);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserResponse.fromJson(data);
    } else {
      throw Exception("Lỗi khi tải thông tin người dùng");
    }
  }
}
