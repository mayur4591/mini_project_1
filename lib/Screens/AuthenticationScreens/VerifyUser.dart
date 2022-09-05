import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/AuthenticationScreens/emailVerificationScreen.dart';
import 'package:untitled/Screens/AuthenticationScreens/signUpScreen.dart';

class VerifyUser extends StatefulWidget {
  const VerifyUser({Key? key}) : super(key: key);

  @override
  State<VerifyUser> createState() => _VerifyCustomer();
}

class _VerifyCustomer extends State<VerifyUser> {
  // ignore: deprecated_member_use

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  const EmailVerification();
          } else {
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}
