import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'models.dart';
import 'reducers.dart';
import 'epics.dart';
import 'pages/home_page.dart';

/// MAIN APP
void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [EpicMiddleware(AppEpic().call).call],
  );
  runApp(MyApp(store: store));
}

/// UI - MAIN APP
class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Conference App',
        home: HomePage(),
      ),
    );
  }
}
