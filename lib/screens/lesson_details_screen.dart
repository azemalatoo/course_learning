import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/lesson.dart';

class LessonDetailScreen extends StatefulWidget {
  final Lesson lesson;

  LessonDetailScreen({required this.lesson});

  @override
  _LessonDetailScreenState createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  late YoutubePlayerController _controller;

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
          backgroundColor: Colors.green,
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
    color: Colors.black87,
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
    setState(() {});
    },
    ),
    SizedBox(height: 20),

    // Lesson Content (Overview)
    Text(
    'Lesson Overview:',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.green,
    ),
    ),
    SizedBox(height: 10),
    Text(
    widget.lesson.content,  // Display the lesson content here
    style: TextStyle(
    fontSize: 16,
    color: Colors.black87,
    ),
    ),
      SizedBox(height: 20),
    ],
    ),
        ),
    );
  }
}
