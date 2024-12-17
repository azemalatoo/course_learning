import 'package:flutter/material.dart';
import '../models/course.dart';  // Import Course model
import '../models/lesson.dart';  // Import Lesson model
import 'course_detail_screen.dart';  // Import CourseDetailScreen

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: 'Flutter Basics',
      description: 'Learn the basics of Flutter development.',
      lessons: [
        Lesson(title: 'Introduction to Flutter', description: 'Basic setup and introduction'),
        Lesson(title: 'Flutter Widgets', description: 'Learn about Flutter widgets'),
        Lesson(title: 'State Management', description: 'Managing state in Flutter'),
      ],
    ),
    Course(
      title: 'Advanced Flutter',
      description: 'Deep dive into advanced Flutter concepts.',
      lessons: [
        Lesson(title: 'Flutter Animations', description: 'Learn animations in Flutter'),
        Lesson(title: 'Flutter Firebase', description: 'Integrating Firebase with Flutter'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return ListTile(
          title: Text(course.title),
          subtitle: Text(course.description),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetailScreen(course: course),
              ),
            );
          },
        );
      },
    );
  }
}
