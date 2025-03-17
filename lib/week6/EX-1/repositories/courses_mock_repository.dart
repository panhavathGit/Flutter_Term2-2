import 'package:week5/week6/EX-1/repositories/courses_repository.dart';
import 'package:week5/week6/EX-1/models/course.dart';
class CoursesMockRepository extends CoursesRepository{

  final List<Course> courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
  ];

  @override
  List<Course> getCourses() {
    return courses;
  }

  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }
}