import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_part/core/utils/styles.dart';

class CustomMasterCard extends StatelessWidget {
  const CustomMasterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      child: Row(
        children: [
          SvgPicture.asset('assets/images/master_card.svg'),
          const SizedBox(width: 23),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Credit Card\n', style: Styles.styleBold18),
                TextSpan(text: 'MasterCard **34', style: Styles.style18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
