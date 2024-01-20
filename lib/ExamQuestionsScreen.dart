import 'package:flutter/material.dart';

class ExamQuestionsScreen extends StatefulWidget {
  @override
  _ExamQuestionsScreenState createState() => _ExamQuestionsScreenState();
}

class _ExamQuestionsScreenState extends State<ExamQuestionsScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'content': 'What is the capital of France?',
      'options': ['Berlin', 'Paris', 'Madrid', 'Rome'],
      'correctAnswer': 'Paris',
    },
    {
      'content': 'What is the capital of India?',
      'options': ['Delhi', 'Mumbai', 'TamilNadu', 'Goa'],
      'correctAnswer': 'Delhi',
    },
    {
      'content': 'What is the capital of Japan?',
      'options': ['Tokyo', 'Konoha', 'Shibuya', 'Kirigakure'],
      'correctAnswer': 'Tokyo',
    },
    {
      'content': 'Which planet is known as the Red Planet?',
      'options': ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      'correctAnswer': 'Mars',
    },
    {
      'content': 'What is the largest mammal?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
      'correctAnswer': 'Blue Whale',
    },
    {
      'content': 'In which year did Christopher Columbus reach the Americas?',
      'options': ['1492', '1620', '1776', '1812'],
      'correctAnswer': '1492',
    },
    {
      'content': 'What is the capital of Australia?',
      'options': ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
      'correctAnswer': 'Canberra',
    },
    {
      'content': 'Who wrote "Romeo and Juliet"?',
      'options': [
        'Charles Dickens',
        'William Shakespeare',
        'Jane Austen',
        'Mark Twain'
      ],
      'correctAnswer': 'William Shakespeare',
    },
    {
      'content': 'What is the currency of Japan?',
      'options': ['Yuan', 'Won', 'Yen', 'Ringgit'],
      'correctAnswer': 'Yen',
    },
    {
      'content': 'Which element has the chemical symbol "O"?',
      'options': ['Oxygen', 'Gold', 'Carbon', 'Iron'],
      'correctAnswer': 'Oxygen',
    },
    // Add more questions as needed
  ];

  int currentQuestionIndex = 0;
  String selectedAnswer = '';
  int score = 0;

  void showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(
            isCorrect
                ? 'Correct! Well done.'
                : 'Incorrect. The correct answer is ${questions[currentQuestionIndex]['correctAnswer']}.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the result dialog
                if (currentQuestionIndex < questions.length - 1) {
                  // Navigate to the next question
                  setState(() {
                    currentQuestionIndex++;
                    selectedAnswer = '';
                  });
                } else {
                  // Navigate to the results page or end the exam
                  // For simplicity, let's just go back to the main screen
                  Navigator.of(context).pop();
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Questions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(questions[currentQuestionIndex]['content']),
            SizedBox(height: 20),
            // Display options using radio buttons
            for (String option in questions[currentQuestionIndex]['options'])
              RadioListTile(
                title: Text(option),
                value: option,
                groupValue: selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value.toString();
                  });
                },
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check if the selected answer is correct
                bool isCorrect = selectedAnswer ==
                    questions[currentQuestionIndex]['correctAnswer'];

                // Update score if the answer is correct
                if (isCorrect) {
                  setState(() {
                    score++;
                  });
                }

                // Show a dialog with the result
                showResultDialog(isCorrect);
              },
              child: Text('Submit Answer'),
            ),
            SizedBox(height: 10),
            Text('Score: $score'),
          ],
        ),
      ),
    );
  }
}
