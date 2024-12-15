import 'models.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SessionsLoaded) {
    return AppState(sessions: action.sessions, speakers: state.speakers);
  } else if (action is SpeakersLoaded) {
    return AppState(sessions: state.sessions, speakers: action.speakers);
  }
  return state;
}