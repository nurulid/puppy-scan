import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/home/home_screen.dart';
import 'package:puppy_scan/screens/home/scanning_screen.dart';
import 'package:puppy_scan/screens/results/share_popup.dart';
import 'package:puppy_scan/shared/btn_black.dart';
import 'package:puppy_scan/shared/btn_white.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';
import 'package:puppy_scan/shared/image_comparison.dart';
import 'package:puppy_scan/shared/logo.dart';
import 'dart:io';

class ResultsScreen extends StatefulWidget {
  final String? imagePath;
  final String? processedImageUrl;

  const ResultsScreen({super.key, this.imagePath, this.processedImageUrl});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  void _navigateToScanningScreen(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanningScreen(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppBar(
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Color(0xFF0E0E0E),
                ),
                onPressed:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ),
                    },
                padding: EdgeInsets.zero,
                splashRadius: 20,
              ),
            ),
            title: const Logo(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white54,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Download clicked!')),
                    );
                  },
                ),
              ),
            ],
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
                  const SizedBox(height: 140),
                  const Text(
                    "Your Pup's Glow-Up Is Ready!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Made by Pupify ✨',
                    style: TextStyle(color: Color(0xFF5B5B5B)),
                  ),

                  const SizedBox(height: 24),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ImageComparison(
                      imageBefore:
                          widget.imagePath != null
                              ? File(widget.imagePath!)
                              : null,
                      imageAfter:
                          widget.processedImageUrl ?? 'assets/puppy_after.png',
                    ),
                  ),

                  const SizedBox(height: 54),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: BtnWhite(
                            onPressed:
                                () => {
                                  _navigateToScanningScreen(
                                    File(widget.imagePath!).path,
                                  ),
                                },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/icon_rescan.png'),
                                const SizedBox(width: 4),
                                const Text(
                                  'Re-Scan',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: BtnBlack(
                            onPressed:
                                () => ShareBottomSheet.show(
                                  context,
                                  resultImage: widget.processedImageUrl,
                                ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/icon_share.png', width: 20),
                                SizedBox(width: 4),
                                Text('Share', style: TextStyle(fontSize: 16)),
                              ],
                            ),
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
