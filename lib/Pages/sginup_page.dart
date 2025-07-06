import 'package:flutter/material.dart';
import 'package:splach_with_login_firebase/Pages/login_page.dart';

class SginupPage extends StatelessWidget {
  const SginupPage({super.key});
  static String routName = "sginup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        elevation: 15,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'Sgin',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
            children: const [
              TextSpan(
                text: 'Up',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/image_sginup_page.png',
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  elevation: 5,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?  ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginPage.routName,
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
