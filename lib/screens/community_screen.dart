import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
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
        title: Text(
        'Community',
        style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        )),
          backgroundColor: Colors.green,
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Welcome to the Community!',
    style: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    ),
    ),
    SizedBox(height: 15),
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
    color: Colors.green,
    ),
    ),
    SizedBox(height: 10),

    // List of Members
    Expanded(
    child: ListView.builder(
    shrinkWrap: true,
    itemCount: members.length,
    itemBuilder: (context, index) {
    return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    margin: EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
    contentPadding: EdgeInsets.all(15),
    leading: CircleAvatar(
    radius: 30,
    backgroundImage: NetworkImage(members[index]['avatar']!),
    ),
    title: Text(
    members[index]['name']!,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    ),
    ),
    subtitle: Text(
    'Member since 2022',
    style: TextStyle(fontSize: 14, color: Colors.black54),
    ),
    trailing: Icon(Icons.message, color: Colors.green),
    onTap: () {
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
                  // Implement message sending functionality here
                  Navigator.pop(context);
                },
                child: Text('Send'),
              ),
            ],
          );
        },
      );
    },
    ),
    );
    },
    ),
    ),
      SizedBox(height: 20),

      Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You have joined the community!')),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            backgroundColor: Colors.green
          ),
          child: Text(
           'Join the community',
            style: TextStyle(
            fontWeight: FontWeight.bold,  // Make the text bold
            color: Colors.white,         // Set the text color to orange
          ),
        ),
      ),
      )],
    ),
        ),
    );
  }
}
