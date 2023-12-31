import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namaste_yoga/Screens/Home.dart';
import 'package:namaste_yoga/auth/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
// FileImage(File(_imageFile!.path))