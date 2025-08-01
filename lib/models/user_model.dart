class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? phonNumber;
  final DateTime? dateOfBirth;
  final String? profileImage;
  final DateTime? createdAt;
  final DateTime? lastLoginAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phonNumber,
    required this.dateOfBirth,
    required this.profileImage,
    required this.createdAt,
    required this.lastLoginAt,
  });
}
