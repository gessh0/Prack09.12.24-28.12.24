import 'package:flutter/material.dart';

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const Page1(title: 'Страничка хе',),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                final Future<String?> result = Navigator.of(context).push<String>(
                  MaterialPageRoute(
                    builder: (context) => const Page1(title: 'Страничка хе'),
                  ),
                );
                print(result);
              },
              child: const Text('Страница 1'),
            ),
          ],
        ),
      ),
    );
  }
}