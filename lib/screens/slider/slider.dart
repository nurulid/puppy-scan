import 'package:flutter/material.dart';
import 'package:puppy_scan/shared/btn_black.dart';
import 'package:puppy_scan/shared/btn_white.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';
import 'package:puppy_scan/shared/logo.dart';
import 'package:before_after/before_after.dart';

class SliderSc extends StatefulWidget {
  const SliderSc({super.key});

  @override
  State<SliderSc> createState() => _SliderScState();
}

class _SliderScState extends State<SliderSc> {
  double sliderValue = 0.5; // Initial slider position (0.0 to 1.0)

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
                  const Text(
                    'Turn Your Pup Into a Puppy',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'See the glow-up magic in action',
                    style: TextStyle(color: Color(0xFF5B5B5B)),
                  ),

                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Before',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('After'),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: BeforeAfter(
                      trackColor: Colors.white,
                      trackWidth: 6,
                      width: 350,
                      height: 436,
                      thumbWidth: 48,
                      thumbHeight: 48,
                      thumbDecoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/thumb.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      value: sliderValue,
                      before: Image.asset('assets/puppy_before.png'),
                      after: Image.asset('assets/puppy_after.png'),
                      onValueChanged: (value) {
                        setState(() => sliderValue = value);
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
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
          ),
        ],
      ),
    );
  }
}
