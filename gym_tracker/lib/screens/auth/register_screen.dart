import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/settings/settings.dart';
import 'package:gym_tracker/utils/colors_class.dart';
import 'login_screen.dart'; // Assuming LoginScreen is in this file

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello Gym Bro,",
                  style: TextStyle(color: TColor.gray(context), fontSize: 16),
                ),
                Text(
                  "Create Your Account",
                  style: TextStyle(
                      color: TColor.black(context),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                // Username field
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person, color: TColor.gray(context)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                // Email field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/img/email.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                // Password field
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/img/lock.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: TColor.gray(context),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                // Confirm Password field
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/img/lock.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: TColor.gray(context),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const Spacer(),
                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle registration logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray(context).withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "  Or  ",
                      style:
                          TextStyle(color: TColor.black(context), fontSize: 12),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray(context).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                // Social Register Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white(context),
                          border: Border.all(
                            width: 1,
                            color: TColor.gray(context).withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white(context),
                          border: Border.all(
                            width: 1,
                            color: TColor.gray(context).withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                // Login Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: TColor.black(context),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: TColor.black(context),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
