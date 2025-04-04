class UserModel {
  final int id;
  final String email;
  final String name;
  final String mobile;
  UserModel({required this.id, required this.email, required this.name, required this.mobile});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name']  as String? ?? 'Unknown',
      mobile: json['mobile'] as String? ?? '',
    );
  }
}
