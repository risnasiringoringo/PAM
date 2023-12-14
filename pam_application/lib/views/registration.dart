import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pam_application/Controller/AuthController.dart';
import 'package:pam_application/views/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/del.jpeg'),
              ),
              SizedBox(height: 12.0),
              Text(
                'Institut Teknologi Del',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RegistrationForm(),
                ),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _noTeleponController =
      TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'NIK',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _nikController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'NIK is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'NIM',
              prefixIcon: Icon(Icons.school),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _nimController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'NIM is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
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
                return 'Email is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _namaController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama Lengkap is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nomor Handphone',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _noTeleponController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nomor Handphone is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _authController.register(
                  nik: _nikController.text.trim(),
                  nim: _nimController.text.trim(),
                  nama: _namaController.text.trim(),
                  email: _emailController.text.trim(),
                  noTelepon: _noTeleponController.text.trim(),
                  password: _passwordController.text.trim(),
                );

                await Future.delayed(Duration(seconds: 3));

                _authController.isLoading.value = false;

                Get.to(() => LoginPage());
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              minimumSize: Size(100, 40),
              primary: Colors.blue, // Set button color
            ),
            child: Obx(() {
              return _authController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Register',
                      style: TextStyle(fontSize: 16),
                    );
            }),
          ),
        ],
      ),
    );
  }
}


