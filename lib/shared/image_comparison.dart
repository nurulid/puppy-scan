import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';

class ImageComparison extends StatefulWidget {
  const ImageComparison({
    super.key,
    required this.imageBefore,
    required this.imageAfter,
  });

  final String imageBefore;
  final String imageAfter;

  @override
  State<ImageComparison> createState() => _ImageComparison();
}

class _ImageComparison extends State<ImageComparison> {
  double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return BeforeAfter(
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
      before: Image.asset(widget.imageBefore),
      after: Image.asset(widget.imageAfter),
      onValueChanged: (value) {
        setState(() => sliderValue = value);
      },
    );
  }
}
