import 'package:flutter/material.dart';
import 'ExamQuestionsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Examination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Examination'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Online Examination!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the exam questions page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExamQuestionsScreen()),
                );
              },
              child: Text('Start Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
