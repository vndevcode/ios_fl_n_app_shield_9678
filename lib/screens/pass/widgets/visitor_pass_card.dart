import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/constants/app_info.dart';
import 'package:ios_fl_n_app_shield_9678/screens/pass/widgets/qr_like_graphic.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';

/// The main visitor pass card. In [bright] mode it switches to a light,
/// high-contrast palette so it is easier for staff to read on-site.
class VisitorPassCard extends StatelessWidget {
  const VisitorPassCard({
    super.key,
    required this.bright,
    this.compact = false,
  });

  final bool bright;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final bg = bright ? AppColors.beige : AppColors.emeraldDeep;
    final panel = bright ? const Color(0xFFFDFBF3) : AppColors.surface;
    final codeColor = bright ? AppColors.emeraldDeep : AppColors.neon;
    final labelColor = bright ? AppColors.goldSoft : AppColors.textMuted;
    final nameColor = bright ? const Color(0xFF1B2C22) : AppColors.textCream;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: bright ? AppColors.gold : AppColors.neonDim,
          width: 1.6,
        ),
        boxShadow: [
          BoxShadow(
            color: (bright ? AppColors.gold : AppColors.neon)
                .withValues(alpha: bright ? 0.30 : 0.20),
            blurRadius: 26,
            spreadRadius: -4,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bright ? AppColors.emeraldDeep : AppColors.emerald,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gold, width: 1.4),
                ),
                child: const FaIcon(FontAwesomeIcons.water,
                    size: 16, color: AppColors.neon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('VISITOR PASS',
                        style: AppText.overline.copyWith(
                          color: labelColor,
                          fontSize: 10,
                        )),
                    const SizedBox(height: 2),
                    Text('Niagara Service Resort',
                        style: AppText.caption.copyWith(color: nameColor)),
                  ],
                ),
              ),
              _Diamond(bright: bright),
            ],
          ),
          const SizedBox(height: 20),
          QrLikeGraphic(
            seed: AppInfo.passCode,
            size: compact ? 130 : 158,
            foreground:
                bright ? AppColors.emeraldDeep : const Color(0xFF06170F),
            background: bright ? const Color(0xFFFDFBF3) : AppColors.beige,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: bright ? AppColors.gold : AppColors.border,
              ),
            ),
            child: Column(
              children: [
                Text('PASS CODE',
                    style: AppText.overline.copyWith(
                      color: labelColor,
                      fontSize: 10,
                    )),
                const SizedBox(height: 6),
                Text(
                  AppInfo.passCode,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 4,
                    color: codeColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: _Field(
                  label: 'GUEST',
                  value: AppInfo.guestName,
                  color: nameColor,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: _Field(
                  label: 'ACCESS',
                  value: AppInfo.membership,
                  color: nameColor,
                  alignEnd: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.value,
    required this.color,
    this.alignEnd = false,
  });

  final String label;
  final String value;
  final Color color;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.caption.copyWith(letterSpacing: 1.4)),
        const SizedBox(height: 3),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
          style: AppText.body.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _Diamond extends StatelessWidget {
  const _Diamond({required this.bright});
  final bool bright;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.785398, // 45°
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: AppColors.redDiamond,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: bright ? const Color(0xFFB02A38) : const Color(0xFFF06070),
            width: 1,
          ),
        ),
      ),
    );
  }
}
