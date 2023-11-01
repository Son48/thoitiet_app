import 'package:flutter/material.dart';

class CrossedText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CrossedText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
