import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_part/core/utils/styles.dart';
import 'package:payment_part/features/home/widgets/custom_mastercard.dart';
import 'package:payment_part/features/home/widgets/order_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xffededed),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66, left: 18, right: 18),
        child: Column(
          children: [
            const Text(
              'Thank You!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your treansaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            const OrderInfoItem(title: 'Date', value: '26/05/2025'),
            const SizedBox(height: 20),
            const OrderInfoItem(title: 'Time', value: '12:00 PM'),
            const SizedBox(height: 20),
            const OrderInfoItem(title: 'To', value: 'Mahmoud Reda'),
            Divider(
              color: Colors.black.withOpacity(0.2),
              thickness: 2,
              height: 60,
            ),
            const OrderInfoItem(
              title: 'Total',
              value: '\$50.97',
              style: Styles.style24,
            ),
            const SizedBox(height: 20),
            const CustomMasterCard(),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Icon(FontAwesomeIcons.barcode, size: 50),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.green, width: 2),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    'PAID',
                    style: Styles.style22.copyWith(color: Colors.green),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.2 - 20) / 2,
            ),
          ],
        ),
      ),
    );
  }
}
