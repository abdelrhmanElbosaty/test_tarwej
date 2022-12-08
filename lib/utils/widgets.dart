import 'package:flutter/material.dart';

class DefaultWidgets extends StatelessWidget {
  const DefaultWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget buildLoadingProgressWidget() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.orange,
    ),
  );
}
