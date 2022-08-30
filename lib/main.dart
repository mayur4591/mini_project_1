import 'package:flutter/material.dart';
import 'package:untitled/ArFunctionality/demo.dart';
import 'package:untitled/Screens/AuthenticationScreens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO( 44, 53, 57,1),
        body: LoginScreen());
  }
}


