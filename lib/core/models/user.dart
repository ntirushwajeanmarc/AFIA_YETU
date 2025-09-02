class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;
  final UserType userType;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.userType,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profileImage: json['profile_image'],
      userType: UserType.values.firstWhere(
        (e) => e.name == json['user_type'],
        orElse: () => UserType.patient,
      ),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_image': profileImage,
      'user_type': userType.name,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum UserType { patient, doctor, pharmacist, admin }
