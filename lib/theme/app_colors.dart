import 'package:flutter/material.dart';

/// Central color palette for Niagara Service Resort Casino.
///
/// Derived directly from the supplied visuals: emerald green building,
/// neon architectural lines, warm hotel interior lighting, charcoal blacks,
/// gold interior glow, cream text and the red diamond logo accents.
///
/// Rule for the whole app: solid colors only. No semi-transparent surfaces
/// are used for cards or panels. Alpha is reserved for shadows, hairline
/// borders, overlays over photography and disabled states.
abstract final class AppColors {
  // Backgrounds — charcoal / deep forest greens.
  static const Color scaffold = Color(0xFF081210);
  static const Color scaffoldTop = Color(0xFF0B1A15);
  static const Color surface = Color(0xFF102019);
  static const Color surfaceAlt = Color(0xFF14291F);
  static const Color surfaceElevated = Color(0xFF183324);
  static const Color forestDeep = Color(0xFF0C1912);

  // Emerald accent panels.
  static const Color emerald = Color(0xFF1A5B41);
  static const Color emeraldDark = Color(0xFF124130);
  static const Color emeraldDeep = Color(0xFF0E3427);

  // Neon green accent (active states, borders, highlights).
  static const Color neon = Color(0xFF3FE081);
  static const Color neonSoft = Color(0xFF2FB468);
  static const Color neonDim = Color(0xFF1E7A47);

  // Warm beige / gold interior light.
  static const Color gold = Color(0xFFD9B364);
  static const Color goldSoft = Color(0xFFB9954E);
  static const Color beige = Color(0xFFE8D5A9);

  // Text.
  static const Color textCream = Color(0xFFF3EFE3);
  static const Color textMuted = Color(0xFF93A69B);
  static const Color textFaint = Color(0xFF62766B);
  static const Color textOnNeon = Color(0xFF062012);

  // Red diamond accent — used sparingly for small details only.
  static const Color redDiamond = Color(0xFFE0384A);

  // Hairline borders (subtle alpha on top of solid surfaces).
  static const Color border = Color(0xFF244436);
  static const Color borderSoft = Color(0xFF1B342A);

  // Status colors for request badges.
  static const Color statusPending = Color(0xFFD9B364);
  static const Color statusReview = Color(0xFF5AB8E0);
  static const Color statusConfirmed = Color(0xFF3FE081);
  static const Color statusCompleted = Color(0xFF8FA096);

  // Shadow.
  static const Color shadow = Color(0x66000000);
}
