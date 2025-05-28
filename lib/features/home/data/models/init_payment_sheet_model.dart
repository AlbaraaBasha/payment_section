class InitPaymentSheetModel {
  final String customerID;
  final String paymentIntentClientSecret;
  final String ephemeralKey;

  InitPaymentSheetModel({
    required this.customerID,
    required this.paymentIntentClientSecret,
    required this.ephemeralKey,
  });
}
