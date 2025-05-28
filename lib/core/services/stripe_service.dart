import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_part/core/services/api_service.dart';
import 'package:payment_part/core/utils/api_keys.dart';
import 'package:payment_part/features/home/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_part/features/home/data/models/init_payment_sheet_model.dart';
import 'package:payment_part/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_part/features/home/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntenInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntenInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretToken,
    );

    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({
    required InitPaymentSheetModel initPaymentSheetModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerId: initPaymentSheetModel.customerID,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKey,
        paymentIntentClientSecret:
            initPaymentSheetModel.paymentIntentClientSecret,
        merchantDisplayName: 'Albaraa',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntenInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntenInputModel);
    var ephemeralKeySecret = await createEphemeralKey(
      customerId: paymentIntenInputModel.customerID,
    );
    await initPaymentSheet(
      initPaymentSheetModel: InitPaymentSheetModel(
        customerID: paymentIntenInputModel.customerID,
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        ephemeralKey: ephemeralKeySecret.secret!,
      ),
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys?customer',
      token: ApiKeys.secretToken,
      headers: {
        'Stripe-Version': '2025-04-30.basil',
        'Authorization': "Bearer ${ApiKeys.secretToken}",
      },
    );

    return EphemeralKeyModel.fromJson(response.data);
  }
}
