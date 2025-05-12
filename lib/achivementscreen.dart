import 'package:flutter/material.dart';
import 'package:languagelearning/provider.dart';
import 'package:provider/provider.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<ProgressProvider>(context);
    final achievements = progress.achievements;

    return Scaffold(
      appBar: AppBar(title: Text('Achievements')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'XP: ${progress.xp}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            achievements.isEmpty
                ? Center(child: Text('No achievements yet.'))
                : Expanded(
                  child: ListView.builder(
                    itemCount: achievements.length,
                    itemBuilder:
                        (context, index) => Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.emoji_events,
                              color: Colors.amber,
                            ),
                            title: Text(achievements[index]),
                          ),
                        ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
