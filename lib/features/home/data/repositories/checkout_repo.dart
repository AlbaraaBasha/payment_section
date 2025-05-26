import 'package:dartz/dartz.dart';
import 'package:payment_part/core/errors/failures.dart';
import 'package:payment_part/features/home/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePaymnet({
    required PaymentIntentInputModel paymentIntentInputModal,
  });
}
