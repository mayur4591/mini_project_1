import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Screens/AuthenticationScreens/loginScreen.dart';
import 'Screens/HomeScreens/homeScreen.dart';
import 'Screens/ProductView/Placed Oeder.dart';
import 'Screens/ProductView/checkoutpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var isSignedIn ;
  Future<void> getLoginStatus() async {
    setState(() {
      isSignedIn = FirebaseAuth.instance.currentUser != null;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginStatus().then((value) =>
        print(isSignedIn)
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        body: isSignedIn ?  const HomeScren() :  const LoginScreen()
    );
  }
}
