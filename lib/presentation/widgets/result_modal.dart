import 'package:flutter/material.dart';

class ResultModal extends StatelessWidget {
  final String title;
  final String message;
  final bool isSuccess;

  const ResultModal({
    super.key,
    required this.title,
    required this.message,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}