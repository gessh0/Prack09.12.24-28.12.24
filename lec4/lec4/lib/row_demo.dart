import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget{
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(width: 125,height: 125,color: Colors.deepPurple),
          Container(width: 75,height: 75,color: const Color.fromARGB(255, 58, 66, 183)),
          Container(width: 125,height: 125,color: const Color.fromARGB(255, 58, 164, 183))
          ],
      ),
    );
  }
}