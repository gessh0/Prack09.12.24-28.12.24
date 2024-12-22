import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Page 1 - $title'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('[Hehehehehe]');
              },
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}