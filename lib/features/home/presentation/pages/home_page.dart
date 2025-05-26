import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_part/core/widgets/custom_appbar.dart';
import 'package:payment_part/features/home/widgets/my_card_body.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'My Card'),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeFailure) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const MyCardBody();
          },
        ),
      ),
    );
  }
}
