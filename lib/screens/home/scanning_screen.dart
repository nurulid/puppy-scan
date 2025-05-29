import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/results/results_screen.dart';
import 'dart:io';
import 'package:puppy_scan/services/openai_service.dart';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key, this.imagePath});

  final String? imagePath;

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final OpenAIService _openAIService = OpenAIService();
  String? _processedImageUrl;
  String _statusMessage = 'Analyzing Your Pup…';
  String _subStatusMessage = 'Fetching cuteness… one pixel at a time';
  bool _isNavigating = false;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        _progress = _controller.value;
      });
      // update status message based on progress
      _updateMessageBasedOnProgress();

      if (_controller.isCompleted &&
          _processedImageUrl != null &&
          !_isNavigating) {
        _navigateToResults();
      }
    });

    // start the animation
    _controller.animateTo(0.95, duration: const Duration(seconds: 15));

    // process the image with AI
    _processImage();
  }

  void _updateMessageBasedOnProgress() {
    // progress message
    if (_progress < 0.3) {
      _statusMessage = 'Analyzing Your Pup…';
      _subStatusMessage = 'Fetching cuteness… one pixel at a time';
    } else if (_progress < 0.6) {
      _statusMessage = 'Creating Baby Puppy...';
      _subStatusMessage = 'AI is working its magic!';
    } else if (_progress < 0.9) {
      _statusMessage = 'Almost Done!';
      _subStatusMessage = 'Preparing your adorable baby puppy...';
    } else {
      _statusMessage = 'Finishing Up!';
      _subStatusMessage = 'Your baby puppy is ready!';
    }
  }

  Future<void> _processImage() async {
    if (widget.imagePath == null) {
      _showError('No Image Found', 'Please select an image first');
      return;
    }

    try {
      // process image with OpenAI generate
      final File imageFile = File(widget.imagePath!);
      _processedImageUrl = await _openAIService.createBabyPuppy(imageFile);

      if (_controller.value < 0.95) {
        _controller.animateTo(
          0.95,
          duration: const Duration(milliseconds: 500),
        );
      } else {
        _completeAnimation();
      }
    } catch (e) {
      print('Error processing image: $e');
      _showError('Error Processing Image', 'Please try again later');
    }
  }

  void _completeAnimation() {
    _controller.animateTo(1.0, duration: const Duration(milliseconds: 500));
  }

  void _showError(String message, String subMessage) {
    setState(() {
      _statusMessage = message;
      _subStatusMessage = subMessage;
    });

    _controller
        .animateTo(1.0, duration: const Duration(milliseconds: 500))
        .then((_) {
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) Navigator.pop(context);
          });
        });
  }

  void _navigateToResults() {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (context) => ResultsScreen(
              imagePath: widget.imagePath,
              processedImageUrl: _processedImageUrl,
            ),
      ),
    );
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
          // Background image
          if (widget.imagePath != null)
            Positioned.fill(
              child: Container(
                color: Colors.white,
                child: Image.file(File(widget.imagePath!), fit: BoxFit.contain),
              ),
            ),

          // Dark overlay
          Positioned.fill(
            child: Container(color: Color(0xFF0E0E0E).withAlpha(210)),
          ),

          // Loading UI
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      '${(_progress * 100).toStringAsFixed(0)}%',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(
                      width: 145,
                      height: 145,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        backgroundColor: Colors.white54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  _statusMessage,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  _subStatusMessage,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
