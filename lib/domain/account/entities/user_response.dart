import 'package:shipping_clothing_store/data/account/models/user_model.dart';

class UserResponse {
  final String status;
  final UserModel data;

  UserResponse({required this.status, required this.data});
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'],
      data: UserModel.fromJson(json['data']),
      );
  }
}
