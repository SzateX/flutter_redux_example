import 'package:flutter/material.dart';
import '../models.dart';
import 'speaker_detail_page.dart';

class SessionDetailPage extends StatelessWidget {
  final Session session;

  const SessionDetailPage({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(session.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Time: ${session.beginTime} - ${session.endTime}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Location: ${session.place.buildingName} ${session.place.roomName}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text("Description:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(session.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text("Speaker(s):", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...session.speakers.map((speaker) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SpeakerDetailPage(speaker: speaker),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("${speaker.name} ${speaker.surname}", style: TextStyle(fontSize: 16, color: Colors.blue)),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
