part of '../login_page.dart';

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context, listen: false);

    return TextFieldSkin(
      child: StreamBuilder<String?>(
        stream: presenter.emailErrorStream,
        builder: (_, snapshot) {
          final errorText = snapshot.data;

          return TextField(
            onChanged: presenter.validateEmail,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 11, top: 10, bottom: 14),
              hintText: 'E-mail',
              prefixIcon: Icon(Icons.mail),
              border: InputBorder.none,
              errorText: errorText?.isEmpty == true ? null : errorText,
              //errorStyle: TextStyle(height: 5)
            ),
          );
        },
      ),
    );
  }
}
