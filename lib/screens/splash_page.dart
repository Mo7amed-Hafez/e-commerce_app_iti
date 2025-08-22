import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iti_fl_day3/data/sharedPreferences.dart';
import 'package:iti_fl_day3/screens/home_page.dart';
import 'package:iti_fl_day3/screens/login_page.dart';
import 'package:iti_fl_day3/screens/register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    // نخلي فيه delay علشان splash تبان
    await Future.delayed(const Duration(seconds: 2));

    bool loggedIn = await SharedPrefHelper.isLoggedIn();
    String? username = await SharedPrefHelper.getUsername();

    if (loggedIn && username != null) {
      // لو في مستخدم مسجل دخول
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else if (username == null) {
      // لو مفيش مستخدم متسجل أصلاً → يروح Register
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RegisterPage()),
      );
    } else {
      // مستخدم موجود بس مش عامل login → يروح Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircleAvatar(
          radius: 150,
          backgroundImage: AssetImage("assets/logo.png"),
        ),
      ),
    );
  }
}
