import 'package:dio/dio.dart';
import 'actions.dart';
import 'models.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));

  Stream<SessionsLoaded> fetchSessions() async* {
    final response = await _dio.get('/api/lectures/');
    final sessions = (response.data as List)
        .map((json) => Session.fromJson(json))
        .toList();
    yield SessionsLoaded(sessions);
  }

  Stream<SpeakersLoaded> fetchSpeakers() async* {
    final response = await _dio.get('/api/speakers/');
    final speakers = (response.data as List)
        .map((json) => Speaker.fromJson(json))
        .toList();
    yield SpeakersLoaded(speakers);
  }
}
