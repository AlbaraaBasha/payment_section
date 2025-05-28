import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_part/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_part/features/home/presentation/cubit/payment/payment_cubit.dart';
import 'package:payment_part/features/home/presentation/pages/thanks_you_page.dart';
import 'package:payment_part/features/home/widgets/custom_button.dart';
import 'package:payment_part/features/home/widgets/payment_method_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          const SizedBox(height: 16),
          const PaymentMethodsListView(),
          const SizedBox(height: 20),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccessful) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThanksYouPage();
                    },
                  ),
                );
              } else if (state is PaymentFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLaoding: state is PaymentLoading,
                title: 'Continue',
                onPressed: () {
                  PaymentIntentInputModel paymentIntentInputModel =
                      PaymentIntentInputModel(
                        amount: '50',
                        currency: 'USD',
                        customerID: 'cus_SOWr4hEV315LWO',
                      );
                  BlocProvider.of<PaymentCubit>(context).makepayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                    // You need to define paymentIntentInputModel based on your requirements
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
