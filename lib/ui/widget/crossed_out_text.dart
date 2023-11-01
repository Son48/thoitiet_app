import 'package:flutter/material.dart';

class CrossedOutText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CrossedOutText({
    Key ? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            text,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}