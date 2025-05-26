import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_part/features/home/data/models/payment_intent_input_model.dart';
import 'package:payment_part/features/home/data/repositories/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makepayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePaymnet(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (failure) {
        emit(PaymentFailure(errorMessage: failure.errMessage));
      },
      (success) {
        emit(PaymentSuccessful());
      },
    );
  }
}
