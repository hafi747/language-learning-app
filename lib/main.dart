import 'package:flutter/material.dart';
import 'package:languagelearning/home.dart';
import 'package:languagelearning/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(LanguageLearningApp(prefs: prefs));
}

class LanguageLearningApp extends StatelessWidget {
  final SharedPreferences prefs;
  LanguageLearningApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProgressProvider(prefs),
      child: MaterialApp(
        title: 'LangQuest',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
