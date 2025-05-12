import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressProvider extends ChangeNotifier {
  int _lessonsCompleted = 0;
  int _quizzesCompleted = 0;
  int _xp = 0;
  List<String> _achievements = [];

  final SharedPreferences prefs;
  ProgressProvider(this.prefs) {
    _loadFromPrefs();
  }

  int get lessonsCompleted => _lessonsCompleted;
  int get quizzesCompleted => _quizzesCompleted;
  int get xp => _xp;
  List<String> get achievements => _achievements;

  void completeLesson() {
    _lessonsCompleted++;
    _xp += 10;
    _updateAchievements();
    _saveToPrefs();
    notifyListeners();
  }

  void completeQuiz() {
    _quizzesCompleted++;
    _xp += 20;
    _updateAchievements();
    _saveToPrefs();
    notifyListeners();
  }

  void _updateAchievements() {
    if (_lessonsCompleted == 1 && !_achievements.contains("First Lesson!")) {
      _achievements.add("First Lesson!");
    }
    if (_quizzesCompleted == 1 && !_achievements.contains("First Quiz!")) {
      _achievements.add("First Quiz!");
    }
    if (_xp >= 100 && !_achievements.contains("100 XP Reached!")) {
      _achievements.add("100 XP Reached!");
    }
  }

  void _saveToPrefs() {
    prefs.setInt('lessonsCompleted', _lessonsCompleted);
    prefs.setInt('quizzesCompleted', _quizzesCompleted);
    prefs.setInt('xp', _xp);
    prefs.setStringList('achievements', _achievements);
  }

  void _loadFromPrefs() {
    _lessonsCompleted = prefs.getInt('lessonsCompleted') ?? 0;
    _quizzesCompleted = prefs.getInt('quizzesCompleted') ?? 0;
    _xp = prefs.getInt('xp') ?? 0;
    _achievements = prefs.getStringList('achievements') ?? [];
    notifyListeners();
  }
}
