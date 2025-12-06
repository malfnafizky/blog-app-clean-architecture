import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ShowSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content)));
}
