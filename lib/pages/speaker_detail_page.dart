/// UI - SPEAKER DETAIL PAGE
library;
import 'package:flutter/material.dart';
import '../models.dart';

class SpeakerDetailPage extends StatelessWidget {
  final Speaker speaker;

  const SpeakerDetailPage({super.key, required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${speaker.name} ${speaker.surname}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${speaker.name} ${speaker.surname}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Description:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(speaker.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
