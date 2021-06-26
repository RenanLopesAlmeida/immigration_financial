import 'package:flutter/material.dart';

class TextFieldSkin extends StatelessWidget {
  const TextFieldSkin({required this.child, this.margin});

  final Widget child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 48,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: child,
    );
  }
}
