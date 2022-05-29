import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:pathfinder/screen/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WelcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
          color: Colors.white,
          child: Lottie.asset("assets/lottie/giris.json"),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
              color: Colors.white,
              image:
                  DecorationImage(image: AssetImage("assets/images/logo.png"))),
        ),
      ],
    ));
  }
}
