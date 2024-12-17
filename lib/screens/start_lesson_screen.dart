import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/lesson.dart';  // Ensure to import your Lesson model

class StartLessonScreen extends StatefulWidget {
  final Lesson lesson;

  StartLessonScreen({required this.lesson});

  @override
  _StartLessonScreenState createState() => _StartLessonScreenState();
}

class _StartLessonScreenState extends State<StartLessonScreen> {
  late YoutubePlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    // Convert URL to YouTube video ID
    String videoId = YoutubePlayer.convertUrlToId(widget.lesson.videoUrl) ?? '';

    // Initialize the controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true, // Video will start automatically
        mute: false,    // Video will not be muted by default
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();  // Dispose of the controller when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),  // Show lesson title in the app bar
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
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),

            // YouTube Player
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true, // Show video progress bar
              onReady: () {
                setState(() {
                  _isVideoInitialized = true; // Video is ready, set the flag
                });
              },
            ),
            SizedBox(height: 20),

            // Only display additional content once the video is initialized
            if (_isVideoInitialized)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Additional lesson content
                  Text(
                    'Additional Lesson Content:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('This is the content of the lesson. You can add more resources, explanations, or exercises here.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),

                  // Complete Lesson Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle any actions when the lesson is completed
                      // Example: Navigate to the next lesson or mark the lesson as complete
                    },
                    child: Text('Complete Lesson'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
