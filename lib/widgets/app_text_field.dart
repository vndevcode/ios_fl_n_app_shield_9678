import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';

/// Labeled solid text field used inside request forms. Supports an inline
/// error message shown below the field for simple validation.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.icon,
    this.errorText,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final FaIconData? icon;
  final String? errorText;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.label),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: hasError ? AppColors.redDiamond : AppColors.border,
              width: 1.3,
            ),
          ),
          padding: const EdgeInsets.only(right: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) ...[
                SizedBox(
                  width: 44,
                  child: Center(
                    child: FaIcon(icon, size: 15, color: AppColors.textMuted),
                  ),
                ),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  maxLines: maxLines,
                  keyboardType: keyboardType,
                  cursorColor: AppColors.neon,
                  style: AppText.body,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: AppText.body.copyWith(color: AppColors.textFaint),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 7),
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.circleExclamation,
                  size: 12, color: AppColors.redDiamond),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  errorText!,
                  style: AppText.caption.copyWith(color: AppColors.redDiamond),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
