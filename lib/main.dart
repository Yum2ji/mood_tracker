import 'package:flutter/material.dart';
import 'package:mood_tracker/common/main_navigation_screen.dart';
import 'package:mood_tracker/features/authentication/widgets/sign_up_screen.dart';

void main() {
  runApp(const MoodTracker());
}

class MoodTracker extends StatelessWidget {
  const MoodTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Tracker',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFECE6C2),
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFECE6C2),
        bottomAppBarTheme: BottomAppBarTheme(
            color: Color(0xFFECE6C2),
        ),
      ),
      home: MainNavigationScreen(tab: "home"),
    );
  }
}
