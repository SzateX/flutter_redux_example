import 'package:flutter/material.dart';
import 'schedule_page.dart';
import 'speakers_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conference App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Placeholder(fallbackHeight: 150),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SchedulePage()),
            ),
            child: Text('Schedule'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SpeakersPage()),
            ),
            child: Text('Speakers'),
          ),
        ],
      ),
    );
  }
}
