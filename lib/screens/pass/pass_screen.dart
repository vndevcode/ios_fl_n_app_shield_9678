import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/screens/pass/fullscreen_pass_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/pass/widgets/visitor_pass_card.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/screen_header.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/solid_card.dart';

/// Tab 2 — Visitor Pass.
class PassScreen extends StatelessWidget {
  const PassScreen({super.key});

  static const _statements = [
    'Show this pass during your visit.',
    'Staff may activate full access on-site.',
    'Use it for service support and booking confirmation.',
    'Keep your pass visible when requested.',
  ];

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
            AppTheme.screenPad, 14, AppTheme.screenPad, 28),
        children: [
          const ScreenHeader(
            overline: 'On-site access',
            title: 'Visitor Pass',
            subtitle:
                'Use your pass for support, service confirmation, and on-site assistance.',
          ),
          const SizedBox(height: 22),
          VisitorPassCard(bright: state.passBright),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _PassAction(
                  icon: state.passBright
                      ? FontAwesomeIcons.solidSun
                      : FontAwesomeIcons.sun,
                  label: state.passBright ? 'Brightness On' : 'Increase Brightness',
                  active: state.passBright,
                  onTap: state.togglePassBright,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _PassAction(
                  icon: FontAwesomeIcons.expand,
                  label: 'Open Fullscreen',
                  active: false,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const FullscreenPassScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Text('How your pass works', style: AppText.sectionTitle),
          const SizedBox(height: 14),
          SolidCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Column(
              children: [
                for (var i = 0; i < _statements.length; i++) ...[
                  _StatementRow(text: _statements[i]),
                  if (i != _statements.length - 1)
                    Divider(color: AppColors.borderSoft, height: 1),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PassAction extends StatelessWidget {
  const _PassAction({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  final FaIconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? AppColors.emeraldDark : AppColors.surface,
      borderRadius: BorderRadius.circular(AppTheme.smallRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.smallRadius),
            border: Border.all(
              color: active ? AppColors.neon : AppColors.border,
              width: active ? 1.6 : 1,
            ),
          ),
          child: Column(
            children: [
              FaIcon(icon,
                  size: 20,
                  color: active ? AppColors.neon : AppColors.textCream),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppText.caption.copyWith(
                  color: active ? AppColors.neon : AppColors.textCream,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatementRow extends StatelessWidget {
  const _StatementRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FaIcon(FontAwesomeIcons.solidCircleCheck,
              size: 17, color: AppColors.neon),
          const SizedBox(width: 14),
          Expanded(child: Text(text, style: AppText.body)),
        ],
      ),
    );
  }
}
