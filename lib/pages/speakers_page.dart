import 'package:flutter/material.dart';
import '../models.dart';
import 'speaker_detail_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions.dart';

class SpeakersPage extends StatelessWidget {
  const SpeakersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Speakers')),
      body: StoreConnector<AppState, List<Speaker>>(
        converter: (store) => store.state.speakers,
        onInit: (store) => store.dispatch(LoadSpeakers()),
        builder: (context, speakers) => ListView.builder(
          itemCount: speakers.length,
          itemBuilder: (context, index) {
            final speaker = speakers[index];
            return ListTile(
              title: Text("${speaker.name} ${speaker.surname}"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SpeakerDetailPage(speaker: speaker),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
