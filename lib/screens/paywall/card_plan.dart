import 'package:flutter/material.dart';

class CardPlan extends StatelessWidget {
  const CardPlan({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    this.discount = '',
    this.isHighlight = false,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String description;
  final String price;
  final String discount;
  final bool isHighlight;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  Color getContainerColor() {
    return isHighlight ? const Color(0xFF202020) : Colors.white;
  }

  Color getTextColor() {
    return isHighlight ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        onChanged(value); // Trigger the same behavior as radio button click
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: getContainerColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: getTextColor(),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: title,
                              style: TextStyle(
                                color: getTextColor(),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (discount.isNotEmpty) ...[
                              const WidgetSpan(child: SizedBox(width: 10)),
                              WidgetSpan(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEBEBEB),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '$discount OFF',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          color: getTextColor().withAlpha((0.9 * 255).toInt()),
                        ),
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
      ),
    );
  }
}
