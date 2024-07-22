class User {
  final int? userId; // Make userId nullable
  final String username;
  final String email;
  final String password;
  final String token;

  User({
    this.userId, // Optional parameter
    required this.username,
    required this.email,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'username': username,
      'email': email,
      'password': password,
      'token': token,
    };
    if (userId != null) {
      map['userId'] = userId.toString(); // Include userId if available
    }
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'], // Retrieve userId from the map
      username: map['username'],
      email: map['email'],
      password: map['password'],
      token: map['token'],
    );
  }
}
