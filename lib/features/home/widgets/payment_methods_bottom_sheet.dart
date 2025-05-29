import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_part/core/utils/api_keys.dart';
import 'package:payment_part/features/home/data/models/amout_model/amout_model.dart';
import 'package:payment_part/features/home/data/models/amout_model/details.dart';
import 'package:payment_part/features/home/data/models/item_list_model/item.dart';
import 'package:payment_part/features/home/data/models/item_list_model/item_list_model.dart';
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
                  if (BlocProvider.of<PaymentCubit>(context).currentIndex ==
                      0) {
                    executeStripePayment(context);
                  } else if (BlocProvider.of<PaymentCubit>(
                        context,
                      ).currentIndex ==
                      1) {
                    var data = getTransictionsData();
                    executePaypalPayment(context, data);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '50',
      currency: 'USD',
      customerID: 'cus_SOWr4hEV315LWO',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makepayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel ordersItemList}) data,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.paypalClientId,
              secretKey: ApiKeys.paypalSecretKey,
              transactions: [
                {
                  "amount": data.amount.toJson(),
                  "description": "The payment transaction description.",

                  "item_list": data.ordersItemList.toJson(),
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThanksYouPage();
                    },
                  ),
                );
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
                SnackBar(content: Text("Payment failed: $error"));
              },
              onCancel: () {
                log('cancelled:');
                Navigator.pop(context);
              },
            ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel ordersItemList}) getTransictionsData() {
    var amount = AmountModel(
      currency: "USD",
      total: "100",
      details: Details(shipping: "0", subtotal: "100", shippingDiscount: 0),
    );

    List<Item> orders = [
      Item(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      Item(name: "Pineapple", quantity: 5, price: "12", currency: "USD"),
    ];

    var ordersItemList = ItemListModel(items: orders);
    return (amount: amount, ordersItemList: ordersItemList);
  }
}
