import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Text('Home Screen'),
    ));
  }
}
