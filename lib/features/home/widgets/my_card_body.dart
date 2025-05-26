import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_part/core/utils/styles.dart';
import 'package:payment_part/features/home/data/repositories/checkout_repo_impl.dart';
import 'package:payment_part/features/home/presentation/cubit/payment/payment_cubit.dart';
import 'package:payment_part/features/home/widgets/custom_button.dart';
import 'package:payment_part/features/home/widgets/order_item_info.dart';
import 'package:payment_part/features/home/widgets/payment_methods_bottom_sheet.dart';

class MyCardBody extends StatelessWidget {
  const MyCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset("assets/images/basket_image.png")),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: r'$42.97'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', value: r'$0'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: r'$8'),
          Divider(color: Colors.grey.shade300, thickness: 2, height: 40),
          const OrderInfoItem(
            title: 'Total',
            value: r'$50.97',
            style: Styles.style24,
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Complete Payment',
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const PaymentDetailsPage();
              //     },
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
