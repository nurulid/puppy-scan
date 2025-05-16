import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/home/home_screen.dart';
import 'package:puppy_scan/screens/paywall/card_plan.dart';
import 'package:puppy_scan/shared/btn_gradient.dart';

class PricingPlans extends StatefulWidget {
  const PricingPlans({super.key});

  @override
  State<PricingPlans> createState() => _PricingPlansState();
}

class _PricingPlansState extends State<PricingPlans> {
  String? selectedPlan = 'lifetime';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardPlan(
          title: 'Lifetime',
          description: 'Pay once, use forever.',
          price: r'$99.99',
          discount: '50%',
          isHighlight: selectedPlan == 'lifetime',
          value: 'lifetime',
          groupValue: selectedPlan,
          onChanged: (value) {
            setState(() {
              selectedPlan = value;
            });
          },
        ),
        const SizedBox(height: 12),
        CardPlan(
          title: 'Monthly',
          description: 'Billed monthly.',
          price: r'$1.99',
          isHighlight: selectedPlan == 'monthly',
          value: 'monthly',
          groupValue: selectedPlan,
          onChanged: (value) {
            setState(() {
              selectedPlan = value;
            });
          },
        ),
        const SizedBox(height: 16),
        BtnGradient(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: const Text(
            'Unlock Pupify',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
