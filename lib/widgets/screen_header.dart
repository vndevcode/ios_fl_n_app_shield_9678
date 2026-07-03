import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_back_button.dart';

/// Header used at the top of screens: optional overline, title and subtitle,
/// with an optional back button and trailing action.
class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.overline,
    this.showBack = false,
    this.onBack,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final String? overline;
  final bool showBack;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBack || trailing != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                if (showBack) AppBackButton(onTap: onBack),
                const Spacer(),
                ?trailing,
              ],
            ),
          ),
        if (overline != null) ...[
          Text(overline!.toUpperCase(), style: AppText.overline),
          const SizedBox(height: 8),
        ],
        Text(title, style: AppText.title),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(subtitle!, style: AppText.bodyMuted),
        ],
      ],
    );
  }
}
