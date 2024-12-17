import 'package:flutter/material.dart';
import '../models/lesson.dart';  // Import the Lesson model

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),  // Display the lesson title
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              lesson.description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add any action here to start the lesson (e.g., video or quiz)
              },
              child: Text('Start Lesson'),
            ),
          ],
        ),
      ),
    );
  }
}
