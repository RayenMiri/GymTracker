import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'login_screen.dart';
import 'package:gym_tracker/widgets/wavy_painter.dart';
import 'package:gym_tracker/services/auth_service.dart';
import 'package:gym_tracker/screens/home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _auth_service = AuthService();

  Future<void> handleRegister() async {
    final result = await _auth_service.registerUser(
        _emailController.text.trim(), _passwordController.text);
    if (result) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    } else {
      // Display an error message or handle the error case
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration failed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
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
                        'Create Your Account',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                  const SizedBox(height: 32.0),
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
                            labelStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Password field
                        TextFormField(
                          controller: _passwordController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Iconsax.lock, color: Colors.white),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white70),
                            suffixIcon: const Icon(Iconsax.eye_slash,
                                color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        // Confirm Password field
                        TextFormField(
                          controller: _confirmPasswordController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Iconsax.lock, color: Colors.white),
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(color: Colors.white70),
                            suffixIcon: const Icon(Iconsax.eye_slash,
                                color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 32.0),
                        // Register Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              handleRegister();
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              side: const BorderSide(color: Colors.blue),
                            ),
                            child: const Text(
                                'Already have an account? Sign In',
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
                            const Text('Or Sign Up With',
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
                                border: Border.all(color: Colors.grey.shade700),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                icon: const Image(
                                  image: AssetImage("assets/google_logo.png"),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            // Facebook container
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade700),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                icon: const Image(
                                  image: AssetImage("assets/facebook_logo.png"),
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
    );
  }
}
