import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pam_application/Controller/AuthController.dart';
import 'package:pam_application/views/registration.dart';
import 'package:pam_application/views/users/homepage_user.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                child: Image.asset(
                    'assets/img/del.jpeg'), // Replace with your logo path
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16.0),
              LoginForm(),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Implement "Lupa Password" here
                },
                child: Text('Lupa Password?'),
              ),
              SizedBox(height: 16.0),
              Text('Or login with'),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center-align buttons
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement "Login with Google" here
                    },
                    icon: Image.asset('assets/img/google.png',
                        height: 24.0), // Replace with your Google logo path
                    label: Text(
                      'Google',
                      style: TextStyle(color: Colors.black), // Text color
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Remove background color
                      shadowColor: Colors.transparent, // Remove shadow
                    ),
                  ),
                  SizedBox(width: 16.0), // Add space between buttons
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement "Login With Facebook" here
                    },
                    icon: Image.asset('assets/img/facebook.png',
                        height: 24.0), // Replace with your Facebook logo path
                    label: Text(
                      'Facebook',
                      style: TextStyle(color: Colors.black), // Text color
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Remove background color
                      shadowColor: Colors.transparent, // Remove shadow
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Registrasi',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigasi ke halaman registrasi menggunakan GetX
                          Get.to(() => RegistrationPage());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              // Validate the form
              if (_formKey.currentState!.validate()) {
                await _authController.login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                );

              }
            },
            child: Obx(() {
              return _authController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
