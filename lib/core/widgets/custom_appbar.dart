import 'package:flutter/material.dart';

AppBar CustomAppBar({required final String title}) {
  return AppBar(
    leading: const Icon(Icons.arrow_back_ios_new),
    elevation: 0,
    centerTitle: true,
    title: Text(title),
    backgroundColor: Colors.transparent,
  );
}
