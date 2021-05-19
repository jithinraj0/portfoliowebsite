import 'package:flutter/material.dart';
import 'package:portfolio_website/test.dart';

import 'utils/styling.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        textTheme: textTheme()
      ),
      home: TestScreen(),
    );
  }
}
