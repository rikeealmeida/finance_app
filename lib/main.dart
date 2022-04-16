import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

main() => runApp(
      const FinanceApp(),
    );

class FinanceApp extends StatelessWidget {
  const FinanceApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
