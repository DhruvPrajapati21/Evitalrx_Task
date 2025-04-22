import 'package:evitalrx_task/Authentication/Providers.dart';
import 'package:evitalrx_task/Homescreen/Batchesscreen.dart';
import 'package:evitalrx_task/Homescreen/UserProvider.dart';
import 'package:evitalrx_task/Homescreen/User_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evitalrx_task/Authentication/Splashscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..loadFromPrefs()),
        ChangeNotifierProvider(create: (_) => UTMProvider()..loadUTMParams()),
        ChangeNotifierProvider(create: (_) => UserProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EvitalRx Medicine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home:Splashscreen(),
    );
  }
}