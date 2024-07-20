class User {
  final String email;
  final String password;
  final String token;

  User({required this.email, required this.password, required this.token});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      password: map['password'],
      token: map['token'],
    );
  }
}
