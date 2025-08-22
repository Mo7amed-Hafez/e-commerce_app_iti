import 'package:flutter/material.dart';

class ConstsData {
  static Color primaryColor = const Color(0xFF324b4e);
  static Color secondaryColor = const Color(0xFF4a6f74);
  static Color secondaryColor2 = const Color(0xFF7e8382);
  static Color lightColor = Colors.blue.shade100;
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}
