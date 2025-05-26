import 'package:flutter/material.dart';
import 'package:payment_part/core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.value,
    this.style,
  });
  final String title, value;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: style ?? Styles.style18,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: style ?? Styles.style18,
        ),
      ],
    );
  }
}
