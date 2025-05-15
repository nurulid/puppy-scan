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
                    borderType: BorderType.RRect,
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
                                  style: TextStyle(color: Color(0xFF5B5B5B)),
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
                                Text(
                                  'Take Photo',
                                  style: TextStyle(fontSize: 16),
                                ),
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
                                Text(
                                  'Upload Photo',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 36, 0, 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Past Scans',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('assets/puppy_sad.png'),
                          const Text(
                            'It’s a little lonely here...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF797979),
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
