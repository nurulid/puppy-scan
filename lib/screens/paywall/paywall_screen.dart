import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/paywall/how_it_works.dart';
import 'package:puppy_scan/screens/paywall/pricing_plans.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';
import 'package:puppy_scan/shared/logo.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Background extends behind AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppBar(
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.chevron_left, color: Color(0xFF0E0E0E)),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                splashRadius: 20,
              ),
            ),
            title: Logo(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),

      body: Stack(
        children: [
          const FullscreenBg(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 130),
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
