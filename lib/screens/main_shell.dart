import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/screens/assistant/assistant_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/events_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/pass/pass_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/resort/resort_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/services/services_screen.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/bottom_tab_bar.dart';

/// The main application shell hosting the five bottom tabs.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // Build-time QA hook to open a specific tab, e.g.
  // `--dart-define=INITIAL_TAB=3`. Defaults to Services (0).
  int _index = const int.fromEnvironment('INITIAL_TAB');

  static const _tabs = [
    TabItem(FontAwesomeIcons.bellConcierge, 'Services'),
    TabItem(FontAwesomeIcons.idCard, 'Pass'),
    TabItem(FontAwesomeIcons.mapLocationDot, 'Resort'),
    TabItem(FontAwesomeIcons.calendarDay, 'Events'),
    TabItem(FontAwesomeIcons.solidCommentDots, 'Assistant'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: IndexedStack(
        index: _index,
        children: const [
          ServicesScreen(),
          PassScreen(),
          ResortScreen(),
          EventsScreen(),
          AssistantScreen(),
        ],
      ),
      bottomNavigationBar: BottomTabBar(
        items: _tabs,
        currentIndex: _index,
        onSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}
