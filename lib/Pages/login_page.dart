import 'package:flutter/material.dart';
import 'package:splach_with_login_firebase/Pages/sginup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String routName = "login";

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
            text: 'Log',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
            children: const [
              TextSpan(
                text: 'In',
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
                'assets/images/image_login_page.png',
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
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

              // Register Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SginupPage.routName);
                    },
                    child: const Text(
                      'Register',
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
