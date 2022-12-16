import 'package:flutter/material.dart';

snackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
