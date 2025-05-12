import 'package:flutter/material.dart';
import 'package:languagelearning/provider.dart';
import 'package:provider/provider.dart';

class LessonsScreen extends StatelessWidget {
  final List<String> lessons = [
    'Greetings',
    'Numbers',
    'Days of the Week',
    'Colors',
  ];

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<ProgressProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Lessons')),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(lessons[index]),
              trailing: ElevatedButton(
                onPressed: () => progress.completeLesson(),
                child: Text('Complete'),
              ),
            ),
      ),
    );
  }
}
