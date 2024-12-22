import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget{
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.red,
       width: 300,
       height: 300,
       foregroundDecoration: BoxDecoration(
       color: Colors.deepPurple.withAlpha(100)
      ),
       padding: const EdgeInsets.all(20),
       child: Container(
      //   decoration: const  BoxDecoration(
      //    color: Colors.purpleAccent,
      //     gradient: LinearGradient(colors: [Colors.blue, Colors.indigo]),
      //    borderRadius:  BorderRadius.all(Radius.circular(16))
      //  ),

       color: Colors.white,
       ),
    );
  }
}