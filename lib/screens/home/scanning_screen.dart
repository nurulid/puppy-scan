import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/results/results_screen.dart';
import 'dart:io';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key, this.imagePath});

  final String? imagePath;

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for 3 seconds
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    // Create a curved animation for smooth progress
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the animation
    _controller.forward();

    // Set up listener to update UI and navigate when complete
    _controller.addListener(() {
      setState(() {});

      if (_controller.isCompleted) {
        _isLoading = false;
        // Navigate to next screen after animation completes
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(imagePath: widget.imagePath),
            ),
          );
        });
      }
    });
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child:
                  widget.imagePath != null
                      ? Image.file(
                        File(widget.imagePath!),
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                      )
                      : Image.asset(
                        'assets/puppy_before.png',
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                      ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF0E0E0E).withAlpha(210),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          '${(_animation.value * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 145,
                          height: 145,
                          child: CircularProgressIndicator(
                            value: _animation.value,
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            backgroundColor: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Analyzing Your Pup…',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fetching cuteness… one pixel at a time',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
