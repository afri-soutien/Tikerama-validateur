import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner un ticket'),
      ),
      body: const Center(
        child: Text('Scanner QR Code - À implémenter'),
      ),
    );
  }
}