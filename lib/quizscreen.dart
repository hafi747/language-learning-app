import 'package:flutter/material.dart';
import 'package:languagelearning/provider.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  final List<Map<String, Object>> questions = [
    {
      'question': 'How do you say "Hello" in Spanish?',
      'answers': ['Hola', 'Bonjour', 'Hallo'],
      'correct': 'Hola',
    },
    {
      'question': 'What is "one" in French?',
      'answers': ['Uno', 'Un', 'Ein'],
      'correct': 'Un',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<ProgressProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Quizzes')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final q = questions[index];
          return Card(
            child: ListTile(
              title: Text(q['question'] as String),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    (q['answers'] as List<String>).map((answer) {
                      return TextButton(
                        onPressed: () {
                          if (answer == q['correct']) {
                            progress.completeQuiz();
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text('Correct!')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Try again!')),
                            );
                          }
                        },
                        child: Text(answer),
                      );
                    }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
