import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget{
 const StackDemo({super.key});

 @override
 Widget build(BuildContext context) {
  return  Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      Container(
        width: 200,
        height: 200,
        color: Colors.amberAccent,
      ),
      Container(
        width: 150,
        height: 150,
        color: const Color.fromARGB(255, 255, 156, 64),
      ),
      Container(
        width: 75,
        height: 75,
        color: const Color.fromARGB(255, 255, 86, 64),
      ),
    ]
  );
 }
}