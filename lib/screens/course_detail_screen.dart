import 'package:flutter/material.dart';
import '../models/course.dart';
import 'lesson_details_screen.dart'; // Import the LessonDetailScreen

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(course.title),
    backgroundColor: Colors.green,
    elevation: 4,
    ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Course Header Section
    Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: Colors.green.withOpacity(0.1),
    borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Icon(
    Icons.book,
    size: 40,
    color: Colors.green,
    ),
    SizedBox(width: 16),
    Expanded(
    child: Text(
    course.description,
    style: TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
    ),
    ),
    ),
    ],
    ),
    ),
    SizedBox(height: 20),
    Divider(color: Colors.grey.shade300, thickness: 1),

    // Lessons List Header
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Text(
    'Lessons in this Course:',
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.green,
    ),
    ),
    ),

    // Lessons List
    Expanded(
    child: ListView.builder(
    itemCount: course.lessons.length,
    itemBuilder: (context, index) {
    final lesson = course.lessons[index];
    return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    elevation: 6,
    child: ListTile(
    contentPadding: EdgeInsets.all(16),
    leading: Icon(
    Icons.video_library,
    color: Colors.green,
    size: 40,
    ),
    title: Text(
    lesson.title,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    ),
    ),
    subtitle: Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Text(
    lesson.description,
    style: TextStyle(fontSize: 14, color: Colors.grey),
    ),
    ),
    trailing: Icon(
    Icons.arrow_forward_ios,
    color: Colors.green,
    size: 18,
    ),
    onTap: () {// Navigate to the Lesson Detail Screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LessonDetailScreen(lesson: lesson),
        ),
      );
    },
    ),
    );
    },
    ),
    ),
    ],
    ),
    ),
    );
  }
}
