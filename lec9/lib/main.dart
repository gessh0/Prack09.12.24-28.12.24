import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lec9/inherited_page.dart';
import 'package:lec9/app_data.dart';
import 'package:lec9/app_data_provider.dart';
import 'package:lec9/provider_page.dart';
import 'package:lec9/util.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(
      backgroundColor: Util.randomColor()),
    child: MaterialApp(
      routes: {
        '/': (context) => const ProviderPage(),
        '/second': (context) => const ProviderPage(),
      },
    ),
  ));
}

