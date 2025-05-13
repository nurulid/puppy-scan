import 'package:flutter/material.dart';

class CardPlan extends StatelessWidget {
  const CardPlan({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    this.discount = '',
  });

  final String title;
  final String description;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF202020),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Icon(Icons.check_circle, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: Color(0xFFEAEAEA)),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
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
