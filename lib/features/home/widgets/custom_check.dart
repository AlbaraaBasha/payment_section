import 'package:flutter/material.dart';

class CustomCheck extends StatelessWidget {
  const CustomCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: -30,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xffededed),
        child: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 25,
          child: Icon(Icons.check, size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
