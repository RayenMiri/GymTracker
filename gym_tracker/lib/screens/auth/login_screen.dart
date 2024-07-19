import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'register_screen.dart';
import 'package:gym_tracker/services/auth_service.dart';
import 'package:gym_tracker/screens/home/home_screen.dart';
import 'package:gym_tracker/widgets/wavy_painter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth_service = AuthService();
  bool _isLoading = false; // Track loading state

  Future<void> handleLogin() async {
    setState(() {
      _isLoading = true; // Show loader
    });

    final result = await _auth_service.loginUser(
        _emailController.text.trim(), _passwordController.text);

    setState(() {
      _isLoading = false; // Hide loader
    });

    if (result) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPaint(
                  painter: WavyPainter(),
                  child: Container(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 100,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Welcome to GymTracker',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 64.0),
                      // Form Section
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          child: Column(children: [
                            // Email field
                            TextFormField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.direct_right,
                                    color: Colors.white),
                                labelText: 'Email',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white70),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            // Password field
                            TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.lock,
                                    color: Colors.white),
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                suffixIcon: const Icon(Iconsax.eye_slash,
                                    color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white70),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 32.0),
                            // Remember Me & Forget Password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                    ),
                                    const Text('Remember me',
                                        style:
                                            TextStyle(color: Colors.white70)),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Forget Password',
                                      style: TextStyle(color: Colors.blue)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            // SignIn Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  handleLogin();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            // Create Account Button
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: const Text('Create Account',
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ),
                            const SizedBox(height: 32.0),
                            // Divider
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade700,
                                    thickness: 0.5,
                                    indent: 20.0,
                                    endIndent: 10.0,
                                  ),
                                ),
                                const Text('Or Sign In With',
                                    style: TextStyle(color: Colors.white70)),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade700,
                                    thickness: 0.5,
                                    indent: 10.0,
                                    endIndent: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            // Social Login Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Google container
                                Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade700),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: IconButton(
                                    icon: const Image(
                                      image:
                                          AssetImage("assets/google_logo.png"),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                // Facebook container
                                Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade700),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: IconButton(
                                    icon: const Image(
                                      image: AssetImage(
                                          "assets/facebook_logo.png"),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading) // Display loader when _isLoading is true
            Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
