import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/presentation/screens/initial/initial_screen.dart';

class FlutterTestAssignmentApp extends StatelessWidget {
  const FlutterTestAssignmentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitilaScreen(),
    );
  }
}
