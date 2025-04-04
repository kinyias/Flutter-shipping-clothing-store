class AuthModel {
  final String token;

  AuthModel({required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(token: json['token']);
  }
}
