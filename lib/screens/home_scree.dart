import 'package:flutter/material.dart';
import 'community_screen.dart';
import '../widgets/feature_widget.dart';
import 'course_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Your Learning Platform!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Unlock your potential with courses that help you grow in your career and personal development.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          SizedBox(height: 30),

          FeatureCard(
            title: 'Courses',
            description: 'Browse through various courses to kickstart your learning journey.',
            icon: Icons.book,
            color: Colors.green,
            onTap: () {
              // Navigate to the CourseListScreen when "Courses" card is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CourseListScreen()),
              );
            },
          ),

          FeatureCard(
            title: 'Community',
            description: 'Join a community of learners and share your experiences.',
            icon: Icons.group,
            color: Colors.green,
            onTap: () {
              // Navigate to the CommunityScreen when "Community" card is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
