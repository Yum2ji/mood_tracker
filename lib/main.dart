import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/common/main_navigation_screen.dart';
import 'package:mood_tracker/features/authentication/widgets/login_screen.dart';
import 'package:mood_tracker/features/authentication/widgets/sign_up_screen.dart';
import 'package:mood_tracker/firebase_options.dart';
import 'package:mood_tracker/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /*
  아래내용처럼 하면, 화면을 옆으로 기울여도 항상 portrait 모드로 움직임.
  */
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  final preferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      child: const MoodTracker(),
    ),
  );
}

class MoodTracker extends ConsumerWidget {
  const MoodTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
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
    );
  }
}
