import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controllers/student_add_controller.dart';
import 'package:student_app_provider/controllers/student_controller.dart';
import 'package:student_app_provider/controllers/student_edit_controller.dart';

import 'screens/student list/student_list.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => StudentAddController()),
    ChangeNotifierProvider(create: (context) => StudentController()),
    ChangeNotifierProvider(create: (context) => StudentEditController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan[800],
          appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan)),
      debugShowCheckedModeBanner: false,
      home: const StudentList(),
    );
  }
}
