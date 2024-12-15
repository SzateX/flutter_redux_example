import 'models.dart';
import 'actions.dart';
import 'services.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpic implements EpicClass<AppState> {
  final ApiService _apiService = ApiService();

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.asyncExpand((action) {
      if (action is LoadSessions) {
        return _apiService.fetchSessions();
      } else if (action is LoadSpeakers) {
        return _apiService.fetchSpeakers();
      }
      return Stream.empty();
    });
  }
}