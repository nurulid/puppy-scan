import 'package:flutter/material.dart';

class BtnBlack extends StatelessWidget {
  const BtnBlack({super.key, required this.onPressed, required this.child});

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity, // Full width
      height: 56, // Standard height
      color: Colors.black,
      textColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.all(16),
      onPressed: onPressed,
      child: child,
    );
  }
}
