import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  // this is used to toogle beterrn sign in and sign up pages
  final VoidCallback showLoginPage;

  const SignUp({super.key, required this.showLoginPage});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  Future accountSignUp() async {
    if (passwordChecker()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      //add details in firebase
       addUserDetails(nameController.text.trim(), emailController.text.trim());

    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password Doesn't match , Check again "),
            );
          });
    }
  }

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('Users').add({
      "Name": name,
      "Email": email,
    });
  }

  bool passwordChecker() {
    if (passwordController.text.trim() == confirmPasswordController.text.trim())
      return true;

    return false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
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
                    child: Text("Join Now...",
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
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Enter Name",
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
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Enter Email ID",
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Enter Password",
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
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Confirm Password",
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
                  child: GestureDetector(
                    onTap: accountSignUp,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff2865DC),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            "Sign UP",
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
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Or",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      // this is used to navigate to login page
                      onTap: widget.showLoginPage,
                      child: Text(
                        " Login Here",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
