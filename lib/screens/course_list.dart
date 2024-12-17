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
        Lesson(title: 'Introduction to Flutter', description: 'Basic setup and introduction', videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
        Lesson(title: 'Flutter Widgets', description: 'Learn about Flutter widgets', videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
        Lesson(title: 'State Management', description: 'Managing state in Flutter', videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
      ],
    ),
    Course(
      title: 'Advanced Flutter',
      description: 'Deep dive into advanced Flutter concepts.',
      lessons: [
        Lesson(title: 'Flutter Animations', description: 'Learn animations in Flutter', videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
        Lesson(title: 'Flutter Firebase', description: 'Integrating Firebase with Flutter', videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
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
