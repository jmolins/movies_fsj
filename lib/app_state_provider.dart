import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';

/// This widget provides the AppState instance to the rest of the widget tree
/// Implemented as an [InheritedWidget] to make it simpler.
class AppStateProvider extends InheritedWidget {
  final AppState appState;
  final Widget child;

  AppStateProvider({
    Key key,
    @required this.appState,
    @required this.child,
  })  : assert(appState != null),
        assert(child != null),
        super(key: key, child: child);

  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppStateProvider)
            as AppStateProvider)
        .appState;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
