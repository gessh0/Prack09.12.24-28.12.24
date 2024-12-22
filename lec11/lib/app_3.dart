import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pathLib;
import 'dart:math' as math;

class App3 extends StatefulWidget {
  const App3({super.key});

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  late Database db;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<String> get getDbPath async => getDatabasesPath();

  Future<void> _init() async {
    try {
      var databasesPath = await getDbPath;
      String path = pathLib.join(databasesPath, 'demo.db');

      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
                'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
          });

      print('Database opened at $path');
      showMessage('BD opened');

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error initializing database: $e');
      showMessage('Error initializing database');
    }
  }

  void showMessage(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: const Duration(seconds: 1),
    ));
  }

  Future<void> deleteDB() async {
    var databasesPath = await getDbPath;
    await deleteDatabase(pathLib.join(databasesPath, 'demo.db'));
  }

  @override
  void dispose() {
    db.close();
    super.dispose();
  }

  Future<void> insertIntoDB() async {
    if (isLoading) return;
    try {
      await db.transaction((txn) async {
        int id1 = await txn.rawInsert(
            'INSERT INTO Test(name, value, num) VALUES("some name", ${math.Random().nextInt(1000)}, ${math.Random().nextDouble()})');
        print('Inserted row with id: $id1');
      });
    } catch (e) {
      print('Error inserting into database: $e');
    }
  }

  Future<void> updateIntoDB() async {
    if (isLoading) return;
    try {
      await db.rawUpdate('UPDATE Test SET name = ?, value = ? WHERE name = ?',
          ['updated name', '9876', 'some name']);
      print('Updated row');
      setState(() {});
    } catch (e) {
      print('Error updating database: $e');
    }
  }

  Future<List<Map>> getDataFromDB() async {
    try {
      List<Map> data = await db.rawQuery('SELECT * FROM Test');
      print('Fetched data: $data');
      return data;
    } catch (e) {
      print('Error fetching data from database: $e');
      return [];
    }
  }

  Future<void> clearDB() async {
    if (isLoading) return;
    try {
      await db.rawDelete('DELETE FROM Test');
      print('Cleared database');
      setState(() {});
    } catch (e) {
      print('Error clearing database: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: insertIntoDB, icon: const Icon(Icons.save)),
          IconButton(onPressed: updateIntoDB, icon: const Icon(Icons.update)),
          IconButton(onPressed: clearDB, icon: const Icon(Icons.delete)),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : FutureBuilder(
              future: getDataFromDB(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка: ${snapshot.error}'),
                  );
                }

                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text('Нет данных'));
                }

                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data!.elementAt(index);

                      return Row(
                        children: [
                          Expanded(
                            child: Text(item['id'].toString()),
                          ),
                          Expanded(
                            child: Text(item['name'].toString()),
                          ),
                          Expanded(
                            child: Text(item['value'].toString()),
                          ),
                          Expanded(
                            child: Text(item['num'].toString()),
                          ),
                        ],
                      );
                    });
              }),
    );
  }
}
