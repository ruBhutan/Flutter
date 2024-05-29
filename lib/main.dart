import 'package:athang_expense_tracker/hoc/home_layout.dart';
import 'package:athang_expense_tracker/plugins/local_notifications_service.dart';
import 'package:athang_expense_tracker/screens/auth/login_screen.dart';
import 'package:athang_expense_tracker/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'plugins/local_shared_preferences.dart';
import 'screens/common/temp_screen.dart';

void main() {
  LocalStorage();
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: HomeLayout(),
    );
  }
}
