import 'package:flutter/material.dart';

class UserModel {
  late String name;
  late String phone;
  late String city;
  late String imageUrl;
  late int rupee;

  UserModel({
    required this.name,
    required this.phone,
    required this.city,
    required this.imageUrl,
    required this.rupee,
  });
}

