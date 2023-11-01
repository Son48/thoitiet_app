import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  final VoidCallback onPressed;

  const TransparentButton({
    Key? key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0), // Độ bo tròn
        border: Border.all(
          color: Colors.white, // Màu đường viền
          width: 0.5, // Độ dày đường viền
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Colors.deepOrangeAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text1,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text2,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
