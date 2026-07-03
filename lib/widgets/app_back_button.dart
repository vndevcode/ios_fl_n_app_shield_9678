import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';

/// Consistent circular back button used on every secondary screen.
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap, this.icon});

  final VoidCallback? onTap;
  final FaIconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceAlt,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap ?? () => Navigator.of(context).maybePop(),
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border, width: 1.2),
          ),
          child: FaIcon(
            icon ?? FontAwesomeIcons.chevronLeft,
            size: 16,
            color: AppColors.textCream,
          ),
        ),
      ),
    );
  }
}
