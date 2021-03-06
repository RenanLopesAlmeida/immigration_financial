part of '../login_page.dart';

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Spacing.small,
        bottom: Spacing.normal,
      ),
      height: 40,
      child: TextButton(
        onPressed: () => Get.offAllNamed('/signUp'),
        child: Text(
          'Sign Up',
          style: Theme.of(context).textTheme.button!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
