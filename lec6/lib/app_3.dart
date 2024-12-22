import 'package:flutter/material.dart';

class App3 extends StatelessWidget{
  const App3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 83, 77, 139)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context)=> const Page1());
        }

        var uri=Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'details') {
              var id = uri.pathSegments[1];
              return MaterialPageRoute(builder: (context)=> Page2(title:id));
        }

        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Неизвестная страница'),
            ),
          ),
        );
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Page 1'),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/details/5');
              },
              child: const Text('На страничку 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, required String title});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Page 2'),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('На страничку 1'),
            ),
          ],
        ),
      ),
    );
  }
}