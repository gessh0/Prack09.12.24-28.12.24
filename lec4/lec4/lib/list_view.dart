import 'package:flutter/material.dart';

const double textSize=22;

class ListViewDemo extends StatelessWidget{
  const ListViewDemo({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     children: [
  //       const Text("Keit",style: TextStyle(fontSize: textSize)),
  //       const Text("Sable",style: TextStyle(fontSize: textSize)),
  //       Container(
  //         height: 25,
  //         width: 25,
  //         color: Colors.deepPurple,
  //         ),
  //       const Text("Leon",style: TextStyle(fontSize: textSize)),
  //       const Text("Mikaela",style: TextStyle(fontSize: textSize)),
  //       const Text("Renato",style: TextStyle(fontSize: textSize)),
  //     ],
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.separated(
  //     itemCount: 5,
  //     separatorBuilder: (context, index){
  //       return const Divider(thickness: 3,);
  //     },
  //     itemBuilder: (context, index){
  //       return  Text ('Item # $index');
  //     },
  //     );
  // }

   @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 200,
      itemBuilder: (context, index){
        return  Text ('Item # $index');
      },
      );
  }
}