import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/home/home.dart';
import 'package:puppy_scan/screens/paywall/paywall.dart';
import 'package:puppy_scan/screens/results/results.dart';
import 'package:puppy_scan/screens/slider/slider.dart';
import 'package:puppy_scan/screens/splash/splash.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Results(),
      // home: Home(),
      // home: Paywall(),
      // home: SliderSc(),
      // home: Splash(),
    ),
  );
}
