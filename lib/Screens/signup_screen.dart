import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtubedemo/Screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _emailController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              spacing: 20,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  controller: _phonenumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    icon: Icon(Icons.email),
                  ),
                ),

                TextFormField(
                  controller: _repasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "conform Password",
                    icon: Icon(Icons.email),
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final repassword = _repasswordController.text.trim();
                    final username = _usernameController.text.trim();
                    final phone = _phonenumberController.text.trim();
                    final password = _passwordController.text.trim();

                    final phoneRegex = RegExp(r"^\d{10}$");
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

                    if (email.isEmpty ||
                        username.isEmpty ||
                        phone.isEmpty ||
                        password.isEmpty ||
                        repassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill the blank ")),
                      );
                      return;
                    }

                    if (!emailRegex.hasMatch(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Enter valid email adress"),
                        ),
                      );
                      return;
                    }

                    if (username.length < 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "username must be atleast 3 characters",
                          ),
                        ),
                      );
                      return;
                    }

                    if (!phoneRegex.hasMatch(phone)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("please enter 10 digits")),
                      );
                      return;
                    }
                    if (password.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Enter valid email adress"),
                        ),
                      );
                      return;
                    }
                    if (repassword != password) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password Not matching")),
                      );
                      return;
                    }
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: username,
                            password: password,
                          );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Signup Suceesfully")),
                      );

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    }on FirebaseAuthException catch (e) {
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message ?? "Signup failed"),),
                      );}
                    },

                    child: Text("Signup"),

                ),

                 
 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
