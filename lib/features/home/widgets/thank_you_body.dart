import 'package:flutter/material.dart';
import 'package:payment_part/features/home/widgets/custom_check.dart';
import 'package:payment_part/features/home/widgets/custom_dashs.dart';
import 'package:payment_part/features/home/widgets/thank_you_card.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          const CustomCheck(),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: -20,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: -20,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          const CustomDashs(),
        ],
      ),
    );
  }
}
