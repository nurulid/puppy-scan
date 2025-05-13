import 'package:flutter/material.dart';

class CardStep extends StatelessWidget {
  const CardStep({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.showLine = true,
  });

  final String image;
  final String title;
  final String description;
  final bool showLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Image.asset(image, width: 48, height: 48),
            if (showLine)
              Center(
                child: Image.asset(
                  'assets/line_vector.png',
                  width: 6,
                  height: 32,
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Color(0xFF5B5B5B)),
            ),
          ],
        ),
      ],
    );
  }
}
