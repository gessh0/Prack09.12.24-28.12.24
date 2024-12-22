import 'package:flutter/material.dart';
import 'package:lec9/app_data.dart';
import 'package:lec9/main.dart';
import 'package:lec9/util.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: context.watch<AppData>().backgroundColor,
            child: Column(
              children: [
                Text(context.watch<AppData>().backgroundColor.toString()),
                ElevatedButton(
                  onPressed: () {
                    context.read<AppData>().changeBackgroundColor(Util.randomColor());
                  },
                  child: const Text('Смена цвета'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: const Text('Вторая страница'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}