import 'package:dartz/dartz.dart';
import 'package:payment_part/core/errors/failures.dart';
import 'package:payment_part/core/services/stripe_service.dart';
import 'package:payment_part/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_part/features/home/data/repositories/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePaymnet({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntenInputModel: paymentIntentInputModel,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
