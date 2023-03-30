import 'package:chatapp/screens/auth_screen.dart';
import 'package:chatapp/screens/sign_up.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
/* intially, share the login page true and this is used to toogle between
  login pages and sign in pages
*/
  bool shareLoginPage = true;

  // this is toogle function used to toogle between pages
  void toogleScreen() {
    setState(() {
      shareLoginPage = !shareLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shareLoginPage) {
      return AuthScreen(
        showRegisterPage: toogleScreen);
    } else {
      return SignUp(
        showLoginPage: toogleScreen,
      );
    }
  }
}
