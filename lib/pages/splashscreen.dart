import 'dart:async';

import 'package:celerry_art/common/theme.dart';
import 'package:celerry_art/pages/navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  void nextPage() {
    timer = Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const NavbarPage(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGreen,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: CircularProgressIndicator(
                color: white,
                strokeWidth: 3,
              ),
            ),
            SvgPicture.asset("assets/svg/splash-logo.svg"),
          ],
        ),
      ),
    );
  }
}
