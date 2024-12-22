// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:lec9/app_data_provider.dart';
// import 'package:lec9/util.dart';

// class InheritedPage extends StatefulWidget{
//   const InheritedPage({super.key});

//   @override
//   State<InheritedPage> createState() => _InheritedPageState();
// }

// class _InheritedPageState extends State<InheritedPage>{
//   @override
//   Widget build(BuildContext context) {
//     var data=AppDataProvider.of(context);
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Center(
//           child: ValueListenableBuilder(
//             valueListenable: data!.appData.color,
//             builder: (context,color, child){
//               return Container(
//               width: 200,
//               height: 200,
//               color: color,
//               child: Column(
//                 children: [
//                   Text(data.appData.color.toString()),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         data.appData.changeBackgroundColor(Util.randomColor());
//                       });
//                     },
//                      child: const Text('Смена цвета')),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('/second');
//                     },
//                      child: const Text('Вторая страница'))
//                 ],
//               ),
//             );
//            },
//           ),
//         ))
//     ) ;   
//   }
// }