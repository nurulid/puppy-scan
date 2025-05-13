import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/paywall/card_step.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOW IT WORKS',
            style: TextStyle(fontSize: 12, color: Color(0xFF5B5B5B)),
          ),
          SizedBox(height: 16),
          CardStep(
            image: 'assets/camera_circle.png',
            title: 'Upload Your Pup',
            description: 'Take or upload any dog pic.',
          ),
          CardStep(
            image: 'assets/magic_circle.png',
            title: 'AI Puppy Boost',
            description: 'Watch your pup transform instantly.',
          ),
          CardStep(
            image: 'assets/share_circle.png',
            title: 'Share Anywhere',
            description: 'Download or share your new puppy look.',
            showLine: false,
          ),
        ],
      ),
    );
  }
}
