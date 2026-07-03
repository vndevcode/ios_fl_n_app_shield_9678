import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';

/// Global scroll behavior that removes visible scrollbars everywhere while
/// keeping smooth scrolling and a soft glow-free overscroll.
class NoScrollbarBehavior extends MaterialScrollBehavior {
  const NoScrollbarBehavior();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // Never render a scrollbar.
    return child;
  }

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // No stretch/glow overscroll indicator.
    return child;
  }
}

abstract final class AppTheme {
  static ThemeData build() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.scaffold,
      canvasColor: AppColors.scaffold,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: AppColors.neon,
        onPrimary: AppColors.textOnNeon,
        secondary: AppColors.gold,
        surface: AppColors.surface,
        onSurface: AppColors.textCream,
        error: AppColors.redDiamond,
      ),
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColors.neon.withValues(alpha: 0.08),
      highlightColor: AppColors.neon.withValues(alpha: 0.04),
      dividerColor: AppColors.border,
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.textCream,
        displayColor: AppColors.textCream,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.neon,
        selectionColor: Color(0x553FE081),
        selectionHandleColor: AppColors.neon,
      ),
    );
  }

  /// Standard horizontal screen padding.
  static const double screenPad = 20;

  /// Standard corner radius for cards and panels.
  static const double cardRadius = 20;
  static const double smallRadius = 14;

  static List<BoxShadow> get cardShadow => const [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 18,
          offset: Offset(0, 10),
        ),
      ];

  static List<BoxShadow> neonGlow(Color color) => [
        BoxShadow(
          color: color.withValues(alpha: 0.28),
          blurRadius: 18,
          spreadRadius: -2,
          offset: const Offset(0, 6),
        ),
      ];
}
