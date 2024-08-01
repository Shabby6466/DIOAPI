class UserModel {
  final int id;
  final String email;
  final String password;
  final String name;
  final String creationAt;
  final String updatedAt;
  final String role;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.creationAt,
    required this.updatedAt,
    required this.role,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      name: json['name'] ?? '',
      creationAt: json['creationAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      role: json['role'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
      'role': role,
      'avatar': avatar,
    };
  }
}
