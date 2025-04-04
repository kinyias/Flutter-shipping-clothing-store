class AuthResponse {
  final String token;

  AuthResponse({required this.token});
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(token: json['token']);
  }
}
