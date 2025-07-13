import 'dart:async';
import 'package:evitalrx_task/Authentication/Providers.dart';
import 'package:evitalrx_task/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Loginscreen.dart';
import '../Homescreen/Homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final auth = Provider.of<AuthProvider>(context, listen: false);
      Timer(const Duration(seconds: 3), () {
        if (auth.isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Homescreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Login()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Image.asset(
          'assets/images/logog.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}