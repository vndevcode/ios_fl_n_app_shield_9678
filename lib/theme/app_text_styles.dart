import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';

/// Typography for the app. Uses the platform default font family with
/// tuned weights, sizes and letter-spacing for a premium, readable feel.
abstract final class AppText {
  static const String _family = '.SF Pro Text';

  static const TextStyle display = TextStyle(
    fontFamily: _family,
    fontSize: 30,
    height: 1.1,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.textCream,
  );

  static const TextStyle title = TextStyle(
    fontFamily: _family,
    fontSize: 24,
    height: 1.15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.textCream,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: _family,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.textCream,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: _family,
    fontSize: 16.5,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
    color: AppColors.textCream,
  );

  static const TextStyle body = TextStyle(
    fontFamily: _family,
    fontSize: 14.5,
    height: 1.45,
    fontWeight: FontWeight.w400,
    color: AppColors.textCream,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    height: 1.45,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle label = TextStyle(
    fontFamily: _family,
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.textMuted,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: _family,
    fontSize: 11.5,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: AppColors.textFaint,
  );

  static const TextStyle button = TextStyle(
    fontFamily: _family,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
  );

  /// Small uppercase overline used for eyebrow labels above headings.
  static const TextStyle overline = TextStyle(
    fontFamily: _family,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.0,
    color: AppColors.neon,
  );
}
