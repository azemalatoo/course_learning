import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/lesson.dart';  // Import the Lesson model
import 'start_lesson_screen.dart'; // Import StartLessonScreen

class LessonDetailScreen extends StatefulWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  _LessonDetailScreenState createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  late YoutubePlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    // Extract the YouTube video ID from the URL provided in the lesson
    String videoId = YoutubePlayer.convertUrlToId(widget.lesson.videoUrl) ?? '';

    // Initialize the YouTube player with the extracted video ID
    _controller = YoutubePlayerController(
      initialVideoId: videoId,  // Pass the extracted video ID
      flags: YoutubePlayerFlags(
        autoPlay: false,  // Video won't autoplay initially
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();  // Dispose of the controller when the screen is disposed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.lesson.title),  // Display the lesson title in the AppBar
    ),
    body: SingleChildScrollView(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Lesson Title
    Text(
    widget.lesson.title,
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),

    // Lesson Description
    Text(
    widget.lesson.description,
    style: TextStyle(
    fontSize: 16,
    color: Colors.black54,
    ),
    ),
    SizedBox(height: 20),

    // YouTube Player (Video)
    YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true,  // Display the video progress indicator
    onReady: () {
    // Video is ready, you can do additional actions
    setState(() {
    _isVideoInitialized = true;
    });
    },
    ),
    SizedBox(height: 20),

    // Additional content (optional)
    Text(
    'Lesson Details:',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Text(
    'This is additional content for the lesson. You can add more resources, explanations, or instructions here.',
    style: TextStyle(fontSize: 16, color: Colors.black54),
    ),
    SizedBox(height: 20),

    // Start Lesson Button
    ElevatedButton(
    onPressed: () {
    // Navigate to the Start Lesson Screen or perform the lesson start action
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => StartLessonScreen(lesson: widget.lesson),
    ),
    );
    },
      child: Text('Start Lesson'),
    ),
    ],
    ),
    ),
    );
  }
}
