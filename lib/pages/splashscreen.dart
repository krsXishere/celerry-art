import 'dart:async';
import 'package:celerry_art/common/theme.dart';
import 'package:celerry_art/pages/navbar_page.dart';
import 'package:celerry_art/widgets/reveal_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          RevealRoute(
            page: const NavbarPage(),
            maxRadius: 800,
            centerAlignment: Alignment.center,
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
