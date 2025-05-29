import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_part/features/home/presentation/cubit/payment/payment_cubit.dart';
import 'package:payment_part/features/home/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethods = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
                BlocProvider.of<PaymentCubit>(context).currentIndex = index;
              });
            },
            child: PaymentMethodItem(
              isActive: activeIndex == index,
              image: paymentMethods[index],
            ),
          );
        },
      ),
    );
  }
}
