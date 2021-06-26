import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Theme.of(context).colorScheme.error,
    content: Text(message, textAlign: TextAlign.center),
  ));
}
