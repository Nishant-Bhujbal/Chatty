import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/forgot_password.dart';

class AuthScreen extends StatefulWidget {
  // this is used to to navigate betwwn the sign up and sign in pages
  final VoidCallback showRegisterPage;

  const AuthScreen({super.key, required this.showRegisterPage});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // text controller helps getting access to waht user types in textfield

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /* to sign in the user if that is in database. this takes the values
  from emailcontroller nad passwordcontroller and if they are in the databse
  they will help you sign in.
  */
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  /* this helps in disposing the values when used*/
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2865DC),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 160,
                              left: 50,
                            ),
                            child: Text("Hey!",
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 50.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 230,
                              left: 50,
                            ),
                            child: Text("Welcome Back...",
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 30.0, color: Colors.white)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(42),
                                  topRight: Radius.circular(42),
                                ),
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            left: 30.0,
                            right: 30.0,
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintText: "Email",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color(0xff2865DC),
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 30.0,
                            right: 30.0,
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintText: "Password",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color(0xff2865DC),
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return ForgotPasswordPage();
                              })));
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 10),
                          child: GestureDetector(
                            onTap: signIn,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff2865DC),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a Member?  ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              // this is used to navigate to signup page
                              onTap: widget.showRegisterPage,
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
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
