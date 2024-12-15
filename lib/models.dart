class AppState {
  final List<Session> sessions;
  final List<Speaker> speakers;

  AppState({required this.sessions, required this.speakers});

  factory AppState.initial() => AppState(sessions: [], speakers: []);
}

class Session {
  final int id;
  final String title;
  final String beginTime;
  final String endTime;
  final String description;
  final Place place;
  final List<Speaker> speakers;

  Session({
    required this.id,
    required this.title,
    required this.beginTime,
    required this.endTime,
    required this.description,
    required this.place,
    required this.speakers,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json['id'],
    title: json['title'],
    beginTime: json['begin_time'],
    endTime: json['end_time'],
    description: json['description'] ?? '',
    place: Place.fromJson(json['place_id']),
    speakers: (json['speakers'] as List)
        .map((s) => Speaker.fromJson(s))
        .toList(),
  );
}

class Place {
  final int id;
  final String buildingName;
  final String roomName;

  Place({required this.id, required this.buildingName, required this.roomName});

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json['id'],
    buildingName: json['building_name'],
    roomName: json['room_name'] ?? '',
  );
}

class Speaker {
  final int id;
  final String name;
  final String surname;
  final String description;

  Speaker({required this.id, required this.name, required this.surname, required this.description});

  factory Speaker.fromJson(Map<String, dynamic> json) => Speaker(
    id: json['id'],
    name: json['name'],
    surname: json['surname'],
    description: json['description'] ?? '',
  );
}
