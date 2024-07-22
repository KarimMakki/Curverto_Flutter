import 'package:flutter/material.dart';

void errorMessageDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        title: const Icon(
          Icons.info_outline,
          color: Colors.red,
          size: 30,
        ),
      );
    },
  );
}
