import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';

/// A solid (never transparent) rounded card with an optional tap handler and
/// active/neon border state.
class SolidCard extends StatelessWidget {
  const SolidCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.color = AppColors.surface,
    this.radius = AppTheme.cardRadius,
    this.active = false,
    this.borderColor,
    this.shadow = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double radius;
  final bool active;
  final Color? borderColor;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    final border = borderColor ??
        (active ? AppColors.neon : AppColors.border);

    final content = Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: border,
          width: active ? 1.6 : 1,
        ),
        boxShadow: shadow ? AppTheme.cardShadow : null,
      ),
      padding: padding,
      child: child,
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: content,
      ),
    );
  }
}
