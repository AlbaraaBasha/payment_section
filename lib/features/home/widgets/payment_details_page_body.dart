import 'package:flutter/material.dart';
import 'package:payment_part/features/home/presentation/pages/thanks_you_page.dart';
import 'package:payment_part/features/home/widgets/custom_button.dart';
import 'package:payment_part/features/home/widgets/custom_credit_card_section.dart';
import 'package:payment_part/features/home/widgets/payment_method_list_view.dart';

class PaymentDetailsPageBody extends StatefulWidget {
  const PaymentDetailsPageBody({super.key});

  @override
  State<PaymentDetailsPageBody> createState() => _PaymentDetailsPageBodyState();
}

class _PaymentDetailsPageBodyState extends State<PaymentDetailsPageBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethodsListView()),

        SliverToBoxAdapter(
          child: CreditCardSection(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),

        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                title: 'Pay',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ThanksYouPage();
                        },
                      ),
                    );
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
