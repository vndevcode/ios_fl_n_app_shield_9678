import 'package:flutter/widgets.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_state.dart';

/// Exposes [AppState] to the widget tree and rebuilds dependents whenever the
/// state notifies listeners.
class AppScope extends InheritedNotifier<AppState> {
  const AppScope({
    super.key,
    required AppState state,
    required super.child,
  }) : super(notifier: state);

  /// Read the state and subscribe to changes.
  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found in the widget tree.');
    return scope!.notifier!;
  }

  /// Read the state without subscribing (for one-off actions in callbacks).
  static AppState read(BuildContext context) {
    final scope = context.getInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found in the widget tree.');
    return scope!.notifier!;
  }
}
