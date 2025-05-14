import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:puppy_scan/shared/btn_black.dart';
import 'package:puppy_scan/shared/btn_white.dart';
import 'package:puppy_scan/shared/fullscreen_bg.dart';
import 'package:puppy_scan/shared/logo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  const SizedBox(height: 50),
                  const Logo(),
                  const SizedBox(height: 24),
                  DottedBorder(
                    radius: Radius.circular(20),
                    color: Colors.white,
                    dashPattern: [4],
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Add Your Puppy',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Snap a fresh pic or upload an old one',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          BtnBlack(
                            onPressed: () => print('Pressed'),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt_outlined, size: 24),
                                SizedBox(width: 12),
                                Text('Take Photo'),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          BtnWhite(
                            onPressed: () => print('Pressed'),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.cloud_upload_outlined, size: 24),
                                SizedBox(width: 12),
                                Text('Upload Photo'),
                              ],
                            ),
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
