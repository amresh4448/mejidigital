class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String status;
  final String avatar;
  final String fullName;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
    required this.avatar,
    required this.fullName,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      status: json['status'],
      avatar: json['avatar'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'status': status,
      'avatar': avatar,
      'fullName': fullName,
    };
  }
}
