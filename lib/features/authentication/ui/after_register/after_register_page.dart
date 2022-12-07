import 'package:flutter/material.dart';

class AfterRegisterPage extends StatelessWidget {
  final String phoneNumber;

  const AfterRegisterPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        phoneNumber,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
