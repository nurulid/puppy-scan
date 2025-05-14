import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullscreenBg(),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/puppy_logo.png",
                  fit: BoxFit.contain,
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 12),
                Text(
                  "Puppy Scan",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ElevatedButton(
                      onPressed: () => print('Get Started pressed'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(160, 160),
                        shape: const CircleBorder(),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          const TextSpan(
                            text: "By tapping 'Get Started' you agree to our",
                          ),
                          WidgetSpan(child: SizedBox(width: 5)),
                          TextSpan(
                            text: 'Terms of Use',
                            style: const TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Terms of Use tapped');
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
