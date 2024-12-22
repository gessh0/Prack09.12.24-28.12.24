import 'package:flutter/material.dart';
import 'package:lec4/container_demo.dart';
// import 'package:lec4/wrap_demo.dart';
// import 'package:lec4/stack_demo.dart';
// import 'package:lec4/row_demo.dart';
// import 'package:lec4/column_demo.dart';
//import 'package:lec4/list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: ((context, constraints){

        return  Row(
          children: [
            if(constraints.maxWidth>800)...[
              Container(
                width: 200,
                height: 200,
                color: Colors.deepPurple,
              ),
              Container(
                width: 200,
                height: 200,
                color: const Color.fromARGB(255, 47, 23, 87),
              )
            ]
            else
            Container(
                width: 300,
                height: 300,
                color: const Color.fromARGB(255, 104, 32, 82),
              )
          ],
          );
      }))),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ContainerDemo(),
      ),
    );
  }
}
