class User {
  final String username;
  final String email;
  final String password;
  final String token;

  User(
      {required this.username,
      required this.email,
      required this.password,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      email: map['email'],
      password: map['password'],
      token: map['token'],
    );
  }
}
