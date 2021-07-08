part of '../sign_up_page.dart';

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context, listen: false);

    return TextFieldSkin(
      margin: EdgeInsets.symmetric(vertical: Spacing.normal),
      child: StreamBuilder<String?>(
        stream: presenter.nameErrorStream,
        builder: (_, snapshot) {
          final errorText = snapshot.data;

          return TextField(
            onChanged: presenter.validateName,
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 11, top: 10, bottom: 14),
              hintText: 'Name',
              prefixIcon: Icon(Icons.person),
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
