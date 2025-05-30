import 'package:flutter/material.dart';
import 'package:medicare/pages/chatbot.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/chatbot': (context) => const Chatbot(),
        '/homepage': (context) => HomePage(),
      },
    );
  }
}
