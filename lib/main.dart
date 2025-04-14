import 'package:evitalrx_task/Authentication/Loginscreen.dart';
import 'package:evitalrx_task/Authentication/Splashscreen.dart';
import 'package:evitalrx_task/Homescreen/Homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EvitalRx_Medicine',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home:Splashscreen()
    );
  }
}