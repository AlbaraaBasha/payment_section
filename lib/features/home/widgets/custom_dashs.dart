import 'package:flutter/material.dart';

class CustomDashs extends StatelessWidget {
  const CustomDashs({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      left: 25,
      bottom: MediaQuery.of(context).size.height * 0.2 + 17,
      child: Row(
        children: List.generate(25, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(height: 3, color: Colors.white),
            ),
          );
        }),
      ),
    );
  }
}
