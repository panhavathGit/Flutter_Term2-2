import 'package:flutter/material.dart';
import 'package:week5/week6/EX-1/models/course.dart';
import 'package:week5/week6/EX-1/repositories/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {

  final CoursesRepository repository;

  CoursesProvider(this.repository);

  List<Course> get courses => repository.getCourses();

  Course getCourseFor(String courseName) {
    return courses.firstWhere((course) => course.name == courseName);
  }

  void addScore(String courseName, CourseScore score) {
    Course course = getCourseFor(courseName);
    repository.addScore(course, score);
    notifyListeners(); // Notify UI to rebuild
  }
}

