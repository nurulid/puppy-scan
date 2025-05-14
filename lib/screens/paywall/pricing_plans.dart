import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/paywall/card_plan.dart';
import 'package:puppy_scan/shared/btn_white.dart';

class PricingPlans extends StatelessWidget {
  const PricingPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardPlan(
          title: 'Lifetime',
          description: 'Pay once, use forever.',
          price: r'$99.99',
          isHighlight: true,
        ),
        SizedBox(height: 12),
        CardPlan(
          title: 'Monthly',
          description: 'Billed monthly.',
          price: r'$1.99',
        ),
        SizedBox(height: 16),
        BtnWhite(
          onPressed: () => print('Pressed'),
          child: Text('Unlock Pupify'),
        ),
      ],
    );
  }
}
