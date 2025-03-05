import 'package:flutter/material.dart';

void main() {
  runApp(const MoodTracker());
}

class MoodTracker extends StatelessWidget {
  const MoodTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Container(),
    );
  }
}

