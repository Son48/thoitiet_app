import 'package:flutter/material.dart';
class DetailBottomSheet extends StatelessWidget {
  const DetailBottomSheet({
    super.key,
    required this.text1,
    required this.icon,
    required this.text2,
    required this.title, required this.onClose, required this.remind,
  });

  final String remind;
  final String text1;
  final IconData icon;
  final String text2;
  final String title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final targetHeight = screenHeight * 2 / 3;

    // Tạo danh sách chứa 8 card
    List<Widget> cards = List.generate(8, (index) {
      return Card(
        color: const Color(0xFF4E7DD3),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [

           Row(
             children: [
               Icon(icon, color: Colors.white),
               Text(title, style: const TextStyle(color: Colors.white)),
             ],
           ),
            const SizedBox(height: 20,),
            Text(text1,style: const TextStyle(color: Colors.white),),
            const SizedBox(height: 10,),
            Text(text2,style: const TextStyle(color: Colors.white),),
          ],
        ),
      );
    });

    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:remind.isEmpty ? 70 : 180),
            child: Container(
              height: targetHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [Colors.black.withOpacity(.2), Colors.black.withOpacity(.0)],
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                children: cards,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(remind,style: const TextStyle(color: Colors.white)),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onClose,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.close,
                  color: Colors.blue,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}