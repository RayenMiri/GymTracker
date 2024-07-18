// login_result.dart
typedef LoginResultHandler = void Function(LoginResult result);

class LoginResult {
  final bool success;
  final String message;

  LoginResult({required this.success, this.message = ''});

  static LoginResult successResult() {
    return LoginResult(success: true);
  }

  static LoginResult failureResult(String message) {
    return LoginResult(success: false, message: message);
  }
}
