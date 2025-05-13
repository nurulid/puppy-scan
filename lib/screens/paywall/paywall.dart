import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/paywall/how_it_works.dart';
import 'package:puppy_scan/screens/paywall/pricing_plans.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';
import 'package:puppy_scan/shared/logo.dart';

class Paywall extends StatelessWidget {
  const Paywall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullscreenBg(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Logo(),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pupify Your Dog With AI',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Before & after pics. Shareable cuteness. Instant transformations.',
                          style: TextStyle(color: Color(0xFF5B5B5B)),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),
                  HowItWorks(),
                  SizedBox(height: 62),
                  PricingPlans(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
