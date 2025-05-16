import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/home/home_screen.dart';
import 'package:puppy_scan/screens/home/scanning_screen.dart';
import 'package:puppy_scan/screens/paywall/paywall_screen.dart';
import 'package:puppy_scan/screens/results/results_screen.dart';
import 'package:puppy_scan/screens/slider/slider_screen.dart';
import 'package:puppy_scan/screens/splash/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/slider': (context) => SliderScreen(),
        '/paywall': (context) => PaywallScreen(),
        '/home': (context) => HomeScreen(),
        '/scanning': (context) => ScanningScreen(),
        '/results': (context) => ResultsScreen(),
      },
    ),
  );
}
