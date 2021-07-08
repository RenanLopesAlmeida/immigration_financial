part of '../sign_up_page.dart';

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context, listen: false);

    return TextFieldSkin(
      margin: EdgeInsets.only(top: Spacing.normal),
      child: StreamBuilder<String?>(
        stream: presenter.passwordErrorStream,
        builder: (_, snapshot) {
          final errorText = snapshot.data;

          return TextField(
            obscureText: true,
            onChanged: presenter.validatePassword,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.only(left: 11, top: 10, bottom: 14),
              prefixIcon: Icon(Icons.lock),
              border: InputBorder.none,
              errorText: errorText?.isEmpty == true ? null : errorText,
            ),
          );
        },
      ),
      // child: StreamBuilder<String?>(
      //   stream: presenter.passwordErrorStream,
      //   builder: (_, snapshot) {
      //     String? errorText = snapshot.data;
      //     return TextField(
      //       onChanged: presenter.validatePassword,
      //       style: TextStyle(decoration: TextDecoration.none),
      //       decoration: InputDecoration(
      //         hintText: 'Password',
      //         contentPadding: EdgeInsets.only(left: 11, top: 10, bottom: 14),
      //         prefixIcon: Icon(Icons.lock),
      //         border: InputBorder.none,
      //         errorText: errorText?.isEmpty == true ? null : errorText,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
