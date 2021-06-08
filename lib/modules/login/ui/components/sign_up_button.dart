part of '../login_page.dart';

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(
        top: Spacing.small,
        bottom: Spacing.normal,
      ),
      height: 40,
      child: StreamBuilder<bool?>(
        stream: presenter.isFormValidStream,
        builder: (_, snapshot) {
          bool? isFormValid = snapshot.data;

          return TextButton(
            onPressed: isFormValid == false ? null : presenter.authenticate,
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          );
        },
      ),
    );
  }
}
