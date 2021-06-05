part of '../login_page.dart';

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context, listen: false);

    return TextFieldSkin(
      margin: EdgeInsets.symmetric(vertical: Spacing.normal),
      child: StreamBuilder<String>(
        stream: presenter.passwordErrorStream,
        builder: (_, snapshot) {
          String errorText = snapshot.data;
          return TextField(
            onChanged: presenter.validatePassword,
            style: TextStyle(decoration: TextDecoration.none),
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: InputBorder.none,
              errorText: errorText?.isEmpty == true ? null : errorText,
            ),
          );
        },
      ),
    );
  }
}
