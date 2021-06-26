import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:immigration_financial/modules/ui/ui.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.asset(
            AssetPath.airplaneLoading,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
