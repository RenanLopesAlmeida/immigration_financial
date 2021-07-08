part of '../sign_up_page.dart';

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _presenter = Provider.of<SignUpPresenter>(context);

    return StreamBuilder<bool?>(
      stream: _presenter.isFormValidStream,
      builder: (_, snapshot) {
        return Container(
          height: 50,
          child: ElevatedButton(
            onPressed: snapshot.data == true ? _presenter.authenticate : null,
            child: Text('Sign Up', style: Theme.of(context).textTheme.button),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
