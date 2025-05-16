import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/slider/slider_screen.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoImageOpacity;
  late Animation<double> _logoTextOpacity;
  late Animation<double> _buttonOpacity;
  late Animation<double> _descOpacity;
  bool _isLoading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    // Staggered animations
    _logoImageOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.25, curve: Curves.easeIn),
      ),
    );

    _logoTextOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.5, curve: Curves.easeIn),
      ),
    );

    _buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1, curve: Curves.easeIn),
      ),
    );

    _descOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1, curve: Curves.easeIn),
      ),
    );

    // Start the animation when widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullscreenBg(),

          // LOGO
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _logoImageOpacity,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _logoImageOpacity.value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    "assets/puppy_logo.png",
                    fit: BoxFit.contain,
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(width: 12),

                AnimatedBuilder(
                  animation: _logoTextOpacity,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _logoTextOpacity.value,
                      child: child,
                    );
                  },
                  child: Text(
                    'Puppy Scan',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
                  // GET STARTED
                  AnimatedBuilder(
                    animation: _buttonOpacity,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _buttonOpacity.value,
                        child: child,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/border_gradient.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),

                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/bg_gradient.png'),
                              fit: BoxFit.contain,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Loading indicator
                              if (_isLoading)
                                SizedBox(
                                  width: 145,
                                  height: 145,
                                  child: CircularProgressIndicator(
                                    value: _progressValue,
                                    strokeWidth: 4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),

                              ElevatedButton(
                                onPressed: () async {
                                  if (_isLoading) return;

                                  setState(() {
                                    _isLoading = true;
                                    _progressValue = 0.0;
                                  });

                                  // Simulate loading
                                  const totalDuration = 2000;
                                  const interval = 50;
                                  final steps = totalDuration ~/ interval;

                                  for (int i = 0; i <= steps; i++) {
                                    await Future.delayed(
                                      Duration(milliseconds: interval),
                                    );
                                    if (!mounted) return;
                                    setState(() {
                                      _progressValue = (i / steps);
                                    });
                                  }

                                  if (mounted) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SliderScreen(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  fixedSize: Size(160, 160),
                                  shape: CircleBorder(),
                                ),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),
                  // DESC
                  AnimatedBuilder(
                    animation: _descOpacity,
                    builder: (context, child) {
                      return Opacity(opacity: _descOpacity.value, child: child);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      margin: const EdgeInsets.only(bottom: 50),
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
