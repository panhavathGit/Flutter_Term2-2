import 'package:week5/week6/EX-1/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  void addScore(Course course, CourseScore score);
}
