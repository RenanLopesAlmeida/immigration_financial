import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:immigration_financial/modules/splash/protocols/protocols.dart';
import 'package:lottie/lottie.dart';
import 'package:immigration_financial/modules/ui/ui.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({required this.presenter});
  final SplashPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (_) {
        presenter.checkAccount();
        presenter.navigateToStream.listen((page) {
          if (page == null) {
            return;
          }

          if (page.isNotEmpty) {
            Get.offAllNamed(page);
          }
        });

        return Center(
          child: Container(
            child: Lottie.asset(
              AssetPath.airplaneLoading,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    ));
  }
}
