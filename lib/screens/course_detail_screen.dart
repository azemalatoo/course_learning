import 'package:flutter/material.dart';
import '../models/course.dart';
import 'lesson_details_screen.dart';  // Import the LessonDetailScreen

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: ListView.builder(
        itemCount: course.lessons.length,  // The number of lessons in the course
        itemBuilder: (context, index) {
          final lesson = course.lessons[index];
          return ListTile(
            title: Text(lesson.title),  // Display the lesson title
            subtitle: Text(lesson.description),  // Optionally display lesson description
            onTap: () {
              // On tap, navigate to the LessonDetailScreen for this lesson
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonDetailScreen(lesson: lesson),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
