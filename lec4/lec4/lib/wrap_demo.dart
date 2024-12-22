import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget{
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      runSpacing: 16,
      children: [
        Container(
          color: Colors.blueAccent,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
            "H1",
            textScaleFactor: 2,
          ))),
           Container(
          color: const Color.fromARGB(255, 149, 68, 255),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
            "H2",
            textScaleFactor: 2,
          ))),
           Container(
          color: const Color.fromARGB(255, 211, 68, 255),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
            "H3",
            textScaleFactor: 2,
          ))),
           Container(
          color: const Color.fromARGB(255, 255, 68, 183),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
            "H4",
            textScaleFactor: 2,
          ))),
           Container(
          color: const Color.fromARGB(255, 255, 68, 68),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
            "H5",
            textScaleFactor: 2,
          ))),
      ],
    );
  }
}