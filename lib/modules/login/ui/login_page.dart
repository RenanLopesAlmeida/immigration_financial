import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../protocols/protocols.dart';
import '../../ui/ui.dart';

part './components/login_header.dart';
part './components/email_input.dart';
part './components/password_input.dart';
part './components/login_button.dart';
part './components/sign_up_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(this._presenter);
  final LoginPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: _colorScheme.primaryVariant,
      body: SafeArea(
        child: Builder(
          builder: (_) {
            _presenter.isLoadingStream.listen((isLoading) {
              if (isLoading == true) {
                showLoading(context);
              } else {
                hideLoading(context);
              }
            });

            _presenter.mainErrorStream.listen((error) {
              print('error: $error');
              if (error != null && error != '') {
                showErrorMessage(context, error);
              }
            }, onDone: () {
              print('ERROOOOO');
            });

            _presenter.navigateToStream.listen((page) {
              if (page == null) {
                return;
              }

              if (page.isNotEmpty) {
                Get.offAllNamed(page);
              }
            });

            return CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Spacing.normal, vertical: Spacing.large),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _LoginHeader(),
                      Expanded(
                        child: Container(
                          child: Provider<LoginPresenter>(
                            create: (_) => _presenter,
                            child: Form(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Spacer(),
                                  _EmailInput(),
                                  _PasswordInput(),
                                  Spacer(),
                                  _LoginButton(),
                                  _SignUpButton(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
