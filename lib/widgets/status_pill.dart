import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';

/// A small solid pill used for availability labels (e.g. "Available Today")
/// and event status (Past / Today / Upcoming).
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.label,
    this.color = AppColors.neon,
    this.filled = false,
  });

  final String label;
  final Color color;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5.5),
      decoration: BoxDecoration(
        color: filled
            ? color
            : Color.alphaBlend(
                color.withValues(alpha: 0.14),
                const Color(0xFF10201A),
              ),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color, width: 1.1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
          color: filled ? AppColors.textOnNeon : color,
        ),
      ),
    );
  }
}
