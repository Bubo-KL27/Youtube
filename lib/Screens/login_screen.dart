import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtubedemo/Screens/responsivechanges.dart';
import 'package:youtubedemo/Screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 8,
                left: 50,
                right: 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Username",
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final user = _usernameController.text.trim();
                      final pass = _passwordController.text.trim();

                      try {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: user,
                          password: pass,
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Responsivechanges(),
                          ),
                        );
                      } catch (e) {
                        String errorMessage = "Login Failed";
                        if (e is FirebaseAuthException) {
                          errorMessage = e.message ?? "Login Failed";
                        } else {
                          errorMessage = e.toString();
                        }
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(errorMessage)));
                      }
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(height: 16),
                  Text("Or "),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text("Sign In"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.g_mobiledata),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
