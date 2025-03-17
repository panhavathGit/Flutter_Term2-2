  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week5/week6/EX-1/providers/courses_provider.dart';
import 'package:week5/week6/EX-1/repositories/courses_mock_repository.dart';

  import 'screens/course_list_screen.dart';

  void main() {
    runApp(
      ChangeNotifierProvider(
        create: (context) => CoursesProvider(CoursesMockRepository()),   
        child: MyApp(),)
    );
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,

        home: CourseListScreen(),
      );
    }
  }
