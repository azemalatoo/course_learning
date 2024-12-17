import 'lesson.dart';  // Import Lesson model

class Course {
  final String title;
  final String description;
  final List<Lesson> lessons;  // List of lessons associated with this course

  Course({required this.title, required this.description, required this.lessons});
}
