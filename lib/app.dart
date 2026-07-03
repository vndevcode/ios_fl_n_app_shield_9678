import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/constants/app_info.dart';
import 'package:ios_fl_n_app_shield_9678/screens/loader_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/main_shell.dart';
import 'package:ios_fl_n_app_shield_9678/screens/onboarding/onboarding_flow.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_state.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';

/// Root application widget. Owns [AppState] and exposes it via [AppScope]
/// placed above [MaterialApp] so modals and pushed routes can reach it.
class NiagaraApp extends StatefulWidget {
  const NiagaraApp({super.key});

  @override
  State<NiagaraApp> createState() => _NiagaraAppState();
}

class _NiagaraAppState extends State<NiagaraApp> {
  final AppState _state = AppState();

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      state: _state,
      child: MaterialApp(
        title: AppInfo.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.build(),
        scrollBehavior: const NoScrollbarBehavior(),
        home: const _AppRoot(),
      ),
    );
  }
}

/// Handles the startup flow: Loader → Onboarding (first launch) → Main App.
class _AppRoot extends StatefulWidget {
  const _AppRoot();

  @override
  State<_AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<_AppRoot> {
  // Build-time QA hook: `--dart-define=SKIP_ONBOARDING=true` boots straight
  // into the main app. Defaults to the normal loader → onboarding flow.
  static const bool _skipOnboarding =
      bool.fromEnvironment('SKIP_ONBOARDING');

  bool _loading = !_skipOnboarding;

  @override
  void initState() {
    super.initState();
    if (_skipOnboarding) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppScope.read(context).completeOnboarding();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);

    final Widget current;
    if (_loading) {
      current = LoaderScreen(
        key: const ValueKey('loader'),
        onDone: () => setState(() => _loading = false),
      );
    } else if (!state.onboardingCompleted) {
      current = OnboardingFlow(
        key: const ValueKey('onboarding'),
        onComplete: state.completeOnboarding,
      );
    } else {
      current = const MainShell(key: ValueKey('main'));
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: current,
    );
  }
}
