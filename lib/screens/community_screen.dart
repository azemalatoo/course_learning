// lib/screens/community_screen.dart
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  // Sample list of community members (you can replace this with real data later)
  final List<Map<String, String>> members = [
    {'name': 'John Doe', 'avatar': 'https://randomuser.me/api/portraits/men/1.jpg'},
    {'name': 'Jane Smith', 'avatar': 'https://randomuser.me/api/portraits/women/1.jpg'},
    {'name': 'Emily Clark', 'avatar': 'https://randomuser.me/api/portraits/women/2.jpg'},
    {'name': 'Michael Brown', 'avatar': 'https://randomuser.me/api/portraits/men/2.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Community'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Welcome to the Community!',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 20),
    Text(
    'Here you can interact with fellow learners, share experiences, and grow together. Join discussions, share your projects, and get feedback from peers.',
    style: TextStyle(fontSize: 18, color: Colors.black54),
    ),
    SizedBox(height: 30),

    // Section Title: Members
    Text(
    'Community Members:',
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
    ),
    ),
    SizedBox(height: 10),

    // List of Members
    Expanded(
    child: ListView.builder(
    shrinkWrap: true,
    itemCount: members.length,
    itemBuilder: (context, index) {
    return ListTile(
    leading: CircleAvatar(
    backgroundImage: NetworkImage(members[index]['avatar']!),
    ),
    title: Text(members[index]['name']!),
    subtitle: Text('Member since 2022'),
    trailing: Icon(Icons.message),
    onTap: () {
    // Optional: Add functionality to send a message or view profile
    showDialog(
    context: context,
    builder: (context) {
    return AlertDialog(
    title: Text('Send a Message to ${members[index]['name']}'),
    content: TextField(
    decoration: InputDecoration(hintText: 'Type your message here'),
    ),
    actions: [
    TextButton(
    onPressed: () => Navigator.pop(context),
    child: Text('Cancel'),
    ),
    TextButton(
    onPressed: () {
    // You can implement sending a message here
    Navigator.pop(context);
    },
    child: Text('Send'),
    ),
    ],
    );
    },
    );
    },
    );
    },
    ),
    ),
      SizedBox(height: 20),

      ElevatedButton(
        onPressed: () {
          // Implement the action to join the community or open a post screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You have joined the community!')),
          );
        },
        child: Text('Join the Community'),
      ),
    ],
    ),
        ),
    );
  }
}
