import 'package:flutter/material.dart';

class FullscreenBg extends StatelessWidget {
  const FullscreenBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'assets/puppy_bg.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
