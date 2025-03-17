import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/courses_provider.dart';
import 'course_score_form.dart';

/* Because now we have change to use provider , comsumer 
 * therefore we can now modify the course screen from statefull 
 * to state less
 */

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {

    return Consumer<CoursesProvider>(builder: (context, coursesProvider, child) {

      // Get the updated course from the provider using the course name
      Course course = coursesProvider.getCourseFor(this.course.name);

      List<CourseScore> scores = course.scores;

      void addScore() async {
        CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
          MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
        );

        if (newScore != null) {
          // Notify the provider to update the course with the new score
          coursesProvider.addScore(course.name, newScore);
        }
      }

      Color scoreColor(double score) {
        return score > 50 ? Colors.green : Colors.orange;
      }

      Widget content = const Center(child: Text('No Scores added yet.'));

      if (scores.isNotEmpty) {
        content = ListView.builder(
          itemCount: scores.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(scores[index].studentName),
            trailing: Text(
              scores[index].studenScore.toString(),
              style: TextStyle(
                color: scoreColor(scores[index].studenScore),
                fontSize: 15,
              ),
            ),
          ),
        );
      }

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            course.name,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: addScore, icon: const Icon(Icons.add)),
          ],
        ),
        body: content,
      );
    });
  }
}
