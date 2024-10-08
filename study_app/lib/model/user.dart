class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? ipAddress;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.ipAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      ipAddress: json['ip_address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (ipAddress != null) 'ip_address': ipAddress,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $firstName $lastName, email: $email)';
  }
}

