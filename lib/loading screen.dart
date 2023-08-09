import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loader2.dart';
import 'login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_mskGaJ.json"),
        splashIconSize: 300,
        nextScreen: Loadertwo(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Colors.black,

      ),

    );
  }
}


