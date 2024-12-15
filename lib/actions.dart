import 'models.dart';

class LoadSessions {}
class LoadSpeakers {}

class SessionsLoaded {
  final List<Session> sessions;
  SessionsLoaded(this.sessions);
}

class SpeakersLoaded {
  final List<Speaker> speakers;
  SpeakersLoaded(this.speakers);
}
