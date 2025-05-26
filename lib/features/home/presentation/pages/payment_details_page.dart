import 'package:flutter/material.dart';
import 'package:payment_part/core/widgets/custom_appbar.dart';
import 'package:payment_part/features/home/widgets/payment_details_page_body.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Details'),
      body: const PaymentDetailsPageBody(),
    );
  }
}
