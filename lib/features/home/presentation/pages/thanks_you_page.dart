import 'package:flutter/material.dart';
import 'package:payment_part/core/widgets/custom_appbar.dart';
import 'package:payment_part/features/home/widgets/thank_you_body.dart';

class ThanksYouPage extends StatelessWidget {
  const ThanksYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Transform.translate(
        offset: const Offset(0, -30),
        child: const ThankYouBody(),
      ),
    );
  }
}
