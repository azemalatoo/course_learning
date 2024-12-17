import 'package:flutter/material.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import 'course_detail_screen.dart';

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
  Course(
  title: 'Frontend Web Development - The Complete Guide',
  description: 'Learn HTML, CSS, JavaScript, and React to become a frontend web developer.',
  lessons: [
  Lesson(
  title: 'HTML Basics',
  description: 'Learn the fundamentals of HTML.',
  videoUrl: 'https://www.youtube.com/watch?v=salY_Sm6mv4',
  content: 'In this lesson, you will learn the foundational concepts of HTML, including the structure of HTML documents, tags, attributes, and how to create basic web pages. You will also explore essential tags such as headings, paragraphs, links, and images.',
  ),
  Lesson(
  title: 'CSS Basics',
  description: 'Learn CSS styling for the web.',
  videoUrl: 'https://www.youtube.com/watch?v=1PnVor36_40&t=25s',
  content: 'This lesson covers the basics of CSS, including how to style HTML elements, control text and background colors, set fonts, and create layouts using box models. You will also learn how to use classes and IDs for styling specific elements on your pages.',
  ),
  Lesson(
  title: 'JavaScript Fundamentals',
  description: 'Master JavaScript programming.',
  videoUrl: 'https://www.youtube.com/watch?v=fGdd9qNwQdQ&list=PLoYCgNOIyGACTDHuZtn0qoBdpzV9c327V',
  content: 'JavaScript is a powerful programming language used to add interactivity to web pages. In this lesson, you will understand the basics of JavaScript, such as variables, data types, functions, and how to manipulate HTML elements dynamically using JavaScript.',
  ),
  ],
  ),
  Course(
  title: 'Complete React Developer Course',
  description: 'Build React apps from scratch using hooks, context, and other modern technologies.',
  lessons: [
  Lesson(
  title: 'Introduction to React',
  description: 'Start learning React and its core concepts.',
  videoUrl: 'https://www.youtube.com/watch?v=N3AkSS5hXMA&t=27s',
  content: 'In this lesson, you will be introduced to React, a popular JavaScript library for building user interfaces. You will learn about components, JSX syntax, and how React allows developers to build fast and dynamic web applications.',
  ),
  Lesson(
  title: 'React Hooks and State',
  description: 'Learn to manage state and effects with React hooks.',
  videoUrl: 'https://www.youtube.com/watch?v=LOH1l-MP_9k',
  content: 'This lesson dives deep into React Hooks, a feature introduced in React 16.8. You will learn how to manage state using the `useState` hook, and handle side-effects using `useEffect`. By the end, you will be able to create stateful components with ease.',
  ),
  ],
  ),
  Course(
  title: 'Introduction to DevOps',description: 'Learn the principles of DevOps and how to implement CI/CD pipelines.',
    lessons: [
      Lesson(
        title: 'What is DevOps?',
        description: 'Understanding the core principles of DevOps.',
        videoUrl: 'https://www.youtube.com/watch?v=Xrgk023l4lI',
        content: 'In this lesson, you will understand the core principles of DevOps, including collaboration, automation, continuous integration, and delivery. DevOps aims to shorten development cycles, improve deployment frequency, and enhance collaboration between development and operations teams.',
      ),
      Lesson(
        title: 'Continuous Integration and Delivery',
        description: 'Learn CI/CD concepts and tools like Jenkins and Docker.',
        videoUrl: 'https://www.youtube.com/watch?v=scEDHsr3APg',
        content: 'This lesson covers Continuous Integration (CI) and Continuous Delivery (CD), two essential practices in modern software development. You will learn how to set up automated pipelines using tools like Jenkins and Docker to automate testing, integration, and deployment.',
      ),
    ],
  ),
    Course(
      title: 'Python for Data Science and Machine Learning',
      description: 'Master Python programming for data science and machine learning.',
      lessons: [
        Lesson(
          title: 'Python Basics for Data Science',
          description: 'Learn Python programming basics with a focus on data science.',
          videoUrl: 'https://www.youtube.com/watch?v=rfscVS0vtbw',
          content: 'This lesson covers the Python basics with a focus on data science. You will learn the syntax, control flow, functions, and how to work with libraries like NumPy and Pandas to analyze data.',
        ),
        Lesson(
          title: 'Machine Learning with Python',
          description: 'Understand machine learning algorithms and how to implement them.',
          videoUrl: 'https://www.youtube.com/watch?v=Gv9_4yMHFhI',
          content: 'In this lesson, you will be introduced to machine learning concepts and how to use Python libraries such as Scikit-learn to implement popular machine learning algorithms like linear regression and decision trees.',
        ),
      ],
    ),
    Course(
      title: 'Complete Cyber Security Course',
      description: 'Learn the basics of cybersecurity, networking, and ethical hacking.',
      lessons: [
        Lesson(
          title: 'Introduction to Cyber Security',
          description: 'What is cybersecurity and why it is important?',
          videoUrl: 'https://www.youtube.com/watch?v=hXSFdwIOfnE',
          content: 'This lesson explains the importance of cybersecurity in today\'s digital world. You will learn about the different types of cyber threats, the need for strong encryption, and how to protect data and systems from various attacks.',
        ),
        Lesson(
          title: 'Ethical Hacking Basics',
          description: 'Learn ethical hacking tools and techniques.',
          videoUrl: 'https://www.youtube.com/watch?v=XLvPpirlmEs',
          content: 'In this lesson, you will learn the basics of ethical hacking. You will understand common hacking techniques used by security professionals to identify vulnerabilities, and how to use tools like Nmap and Metasploit to conduct penetration testing.',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
        'IT Courses & Tutorials',
        style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
    )),
    backgroundColor: Colors.green,
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: ListView.builder(
    itemCount: courses.length,
    itemBuilder: (context, index) {
    final course = courses[index];
    return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
    onTap: () {// Navigate to the course details page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseDetailScreen(course: course),
        ),
      );
    },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              course.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              course.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.play_circle_outline, color: Colors.green),
                Text(
                  'View Lessons',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
    },
    ),
        ),
    );
  }
}
