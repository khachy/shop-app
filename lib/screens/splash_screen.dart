import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // a timer used to show the splash screen for a period of time before naviagting to the welcome page
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Splash screen text
              const Text(
                'GroceryStore',
                style: TextStyle(
                  fontFamily: 'UberMove',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Transform.scale(
                scale: 0.8,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
