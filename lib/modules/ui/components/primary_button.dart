import 'package:flutter/material.dart';

import '../dimens.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.text, required this.onPressed});

  final String text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: Spacing.large),
      child: ElevatedButton(
        onPressed: onPressed == null ? null : () => onPressed?.call(),
        child: Text(text, style: Theme.of(context).textTheme.button),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
