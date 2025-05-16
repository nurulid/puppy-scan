import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';
import 'dart:io';

class ImageComparison extends StatefulWidget {
  const ImageComparison({
    super.key,
    required this.imageBefore,
    required this.imageAfter,
    this.isStatic = false,
  });

  final dynamic imageBefore;
  final dynamic imageAfter;
  final bool isStatic;

  @override
  State<ImageComparison> createState() => _ImageComparison();
}

class _ImageComparison extends State<ImageComparison> {
  double sliderValue = 0.5;

  Widget _buildImage(dynamic imageSource) {
    if (imageSource is String) {
      return Image.asset(imageSource);
    } else if (imageSource is File) {
      return Image.file(imageSource);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
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
            before: _buildImage(widget.imageBefore),
            after: _buildImage(widget.imageAfter),
            onValueChanged: (value) {
              setState(() => sliderValue = value);
            },
          ),
        ),
        Positioned(
          top: 18,
          left: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('After', style: TextStyle(color: Colors.white)),
          ),
        ),
        Positioned(
          top: 18,
          right: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Before'),
          ),
        ),
      ],
    );
  }
}
