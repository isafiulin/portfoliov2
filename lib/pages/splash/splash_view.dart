import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/routes/routes.dart';
import 'package:my_portfolio/pages/splash/componenets/animated_loading_text.dart';
import 'package:my_portfolio/pages/splash/componenets/maskot_image.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.go(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaskotImage(),
            SizedBox(
              height: 16,
            ),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
