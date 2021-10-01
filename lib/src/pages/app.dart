import 'package:flutter/material.dart';
import 'package:area/src/pages/area.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Area(),
    );
  }
}
