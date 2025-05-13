import 'package:flutter/material.dart';
import 'package:puppy_scan/shared/btn_black.dart';
import 'package:puppy_scan/shared/btn_white.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';
import 'package:puppy_scan/shared/logo.dart';

class SliderSc extends StatelessWidget {
  const SliderSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullscreenBg(),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Logo(),
                const SizedBox(height: 24),
                const Text(
                  'Turn Your Pup Into a Puppy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'See the glow-up magic in action',
                  style: TextStyle(color: Color(0xFF5B5B5B)),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset('assets/slider_example.png'),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      BtnBlack(
                        onPressed: () => print('Pressed'),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.apple, size: 24),
                            SizedBox(width: 12),
                            Text('Continue with Apple'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      BtnWhite(
                        onPressed: () => print('Pressed'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/google_icon.png', width: 24),
                            const SizedBox(width: 12),
                            const Text('Continue with Google'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
