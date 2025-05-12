import 'package:flutter/material.dart';
import 'package:languagelearning/achivementscreen.dart';
import 'package:languagelearning/forumscreen.dart';
import 'package:languagelearning/lessonscreen.dart';
import 'package:languagelearning/quizscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LangQuest')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LessonsScreen()),
                    ),
                child: Text('Lessons'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => QuizScreen()),
                    ),
                child: Text('Quizzes'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AchievementsScreen()),
                    ),
                child: Text('Achievements'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ForumScreen()),
                    ),
                child: Text('Community Forum'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
