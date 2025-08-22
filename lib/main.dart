import 'package:flutter/material.dart';
import 'package:iti_fl_day3/screens/cart_page.dart';
import 'package:iti_fl_day3/screens/home_page.dart';
import 'package:iti_fl_day3/screens/login_page.dart';
import 'package:iti_fl_day3/screens/products.dart';
import 'package:iti_fl_day3/screens/profile_page.dart';
import 'package:iti_fl_day3/screens/register_page.dart';
import 'package:iti_fl_day3/screens/splash_page.dart';
import 'package:iti_fl_day3/screens/sttings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashPage',
      routes: {
        '/SplashPage': (context) => const SplashPage(),
        '/LoginPage': (context) => const LoginPage(),
        '/RegisterPage': (context) => const RegisterPage(),
        '/HomePage': (context) => const HomePage(),
        '/ProductsPage': (context) => const ProductsPage(),
        '/CartPage': (context) => const CartPage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/SettingsPage': (context) => const SettingsPage(),
      },
    );
  }
}
