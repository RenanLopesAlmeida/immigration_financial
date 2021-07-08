part of '../sign_up_page.dart';

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Spacing.small,
        bottom: Spacing.normal,
      ),
      height: 40,
      child: TextButton(
        onPressed: () => Get.offAllNamed('/login'),
        child: Text(
          'Already have an account',
          style: Theme.of(context).textTheme.button!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
