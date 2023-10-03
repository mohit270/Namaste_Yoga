import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namaste_yoga/Screens/Home.dart';
import 'package:namaste_yoga/auth/google_sign_in.dart';
import 'package:namaste_yoga/auth/my_button.dart';
import 'package:namaste_yoga/auth/my_textfield.dart';
import 'package:namaste_yoga/auth/square_tile.dart';
import 'package:namaste_yoga/pay/pay_screen.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Center(child: Text(message)));
        });
  }

  @override
  Widget build(BuildContext context) {
    final username = TextEditingController();
    final password = TextEditingController();
    final confirmpassword = TextEditingController();

    void signUserUp() async {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      try {
        if (password.text == confirmpassword.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: username.text, password: password.text);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          showMessage("Password don't match!");
        }
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showMessage(e.code);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 30,
              ),

              //logo
              Icon(
                Icons.lock,
                color: Colors.blueGrey.shade600,
                size: 100,
              ),

              const SizedBox(
                height: 30,
              ),

              Text(
                "Let\'s create an account for you!",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),

              const SizedBox(
                height: 25,
              ),

              //username textfield
              MyTextField(
                  hintText: "UserName Enter",
                  obsecureText: false,
                  controllers: username),

              const SizedBox(
                height: 25,
              ),

              // password
              MyTextField(
                hintText: "Password Enter",
                obsecureText: true,
                controllers: password,
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                hintText: "Confirm Password",
                obsecureText: false,
                controllers: confirmpassword,
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: signUserUp,
                text: 'Sign Up',
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Continue with",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    const Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: Image.asset(
                      'assets/google.png',
                      height: 40,
                    ),
                    onTap: () => AuthService().signInWithgoogle(),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  SquareTile(
                      imagePath: const Column(
                        children: [
                          Text(
                            "BUY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "COFFE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayScreen(context: context),
                            ));
                      })
                ],
              ),

              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have a account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                          color: Colors.blueGrey.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
