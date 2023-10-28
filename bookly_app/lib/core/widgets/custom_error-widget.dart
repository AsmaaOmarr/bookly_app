import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMsg});

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$errorMsg 😢",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
