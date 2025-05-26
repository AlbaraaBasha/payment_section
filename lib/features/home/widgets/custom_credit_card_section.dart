import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardSection extends StatefulWidget {
  const CreditCardSection({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CreditCardSection> createState() => _CreditCardSectionState();
}

class _CreditCardSectionState extends State<CreditCardSection> {
  String cardNumber = '';

  String expiryDate = '07/26';

  String cardHolderName = 'Albaraa Basha';

  String cvvCode = '077';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          isChipVisible: true,
          obscureCardCvv: false,
          bankName: 'Ziraat Bankasi',
          cardType: CardType.mastercard,
          cardBgColor: const Color.fromARGB(255, 213, 37, 24),
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel) {
            setState(() {
              cardNumber = CreditCardModel.cardNumber;
              expiryDate = CreditCardModel.expiryDate;
              cardHolderName = CreditCardModel.cardHolderName;
              cvvCode = CreditCardModel.cvvCode;
              showBackView = CreditCardModel.isCvvFocused;
            });
          },
          formKey: widget.formKey,
        ),
      ],
    );
  }
}
