import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.image,
  });
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 62,
        width: 103,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:
                  isActive ? Colors.green : Colors.black.withValues(alpha: 0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color:
                  isActive ? Colors.green.withValues(alpha: 0.5) : Colors.white,
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Center(child: SvgPicture.asset(image)),
        ),
      ),
    );
  }
}
