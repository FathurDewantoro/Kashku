import 'package:flutter/material.dart';
import 'package:kashku/ui/base/base_screen.dart';
import 'package:kashku/utils/screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashPageScreen extends StatefulWidget {
  const SplashPageScreen({super.key});

  @override
  State<SplashPageScreen> createState() => _SplashPageScreenState();
}

class _SplashPageScreenState extends State<SplashPageScreen> {
  String appVersion = "0.0.1";

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const BaseScreen(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 1000)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: displayWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Image.asset(
              'assets/images/logo/kashku_logo_splash.png',
              scale: 3,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Version $appVersion 💚',
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
