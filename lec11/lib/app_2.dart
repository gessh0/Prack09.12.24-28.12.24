import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App2 extends StatefulWidget {
  const App2({super.key});

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  bool isLoading = true;
  late SharedPreferences prefs;
  final TextEditingController _data = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      prefs = await SharedPreferences.getInstance();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error initializing SharedPreferences: $e');
    }
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Пытаемся преобразовать текст в целое число
        int counterValue = int.parse(_data.text);
        await prefs.setInt('counter', counterValue);
      } catch (e) {
        print('Error parsing int: $e');
        // Если преобразование не удалось, сохраняем строку
        await prefs.setString('action', _data.text);
      }

      setState(() {});
    }
  }

  Future<void> onDeleteFile() async {
    prefs.remove('counter');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text('${prefs.getInt('counter') ?? 'Нет данных INT'}'),
                    Text(prefs.getString('action') ?? 'Нет данных STRING'),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _data,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите данные';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text('Данные'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: onSubmit,
                      child: const Text('Отправить'),
                    ),
                    ElevatedButton(
                      onPressed: onDeleteFile,
                      child: const Text('Удалить'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
