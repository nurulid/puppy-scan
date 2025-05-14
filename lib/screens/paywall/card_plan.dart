import 'package:flutter/material.dart';

class CardPlan extends StatelessWidget {
  const CardPlan({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    this.discount = '',
    this.isHighlight = false,
  });

  final String title;
  final String description;
  final String price;
  final String discount;
  final bool isHighlight;

  Color getContainerColor() {
    return isHighlight ? const Color(0xFF202020) : Colors.white;
  }

  Color getTextColor() {
    return isHighlight ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: getContainerColor(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Icon(Icons.check_circle, color: getTextColor()),
              Radio(value: 'lifetime', groupValue: 'groupValue', onChanged: (String? value) => {}),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: getTextColor(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: getTextColor().withAlpha((0.9 * 255).toInt())),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: getTextColor(),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
