import 'package:flutter/material.dart';
import 'package:payment_part/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isLaoding = false,
  });
  final Function()? onPressed;
  final String title;
  final bool isLaoding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child:
          isLaoding
              ? const CircularProgressIndicator()
              : Text(title, style: Styles.style22),
    );
  }
}
