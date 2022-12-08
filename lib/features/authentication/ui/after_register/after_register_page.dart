import 'package:flutter/material.dart';

class AfterRegisterPage extends StatelessWidget {
  final String phoneNumber;

  const AfterRegisterPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent[200],
        elevation: 0,
      ),
      body: Center(
        child: Text(
          phoneNumber,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
