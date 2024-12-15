import 'package:flutter/material.dart';
import '../models.dart';
import 'session_detail_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule')),
      body: StoreConnector<AppState, List<Session>>(
        converter: (store) => store.state.sessions,
        onInit: (store) => store.dispatch(LoadSessions()),
        builder: (context, sessions) => ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            return ListTile(
              title: Text(session.title),
              subtitle: Text("${session.beginTime} | ${session.place.buildingName} ${session.place.roomName}"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SessionDetailPage(session: session),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
