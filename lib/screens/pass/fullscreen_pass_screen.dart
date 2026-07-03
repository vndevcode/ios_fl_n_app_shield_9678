import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/constants/app_info.dart';
import 'package:ios_fl_n_app_shield_9678/screens/pass/widgets/qr_like_graphic.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_back_button.dart';

/// Fullscreen, bright, high-readability visitor pass shown to staff on-site.
class FullscreenPassScreen extends StatefulWidget {
  const FullscreenPassScreen({super.key});

  @override
  State<FullscreenPassScreen> createState() => _FullscreenPassScreenState();
}

class _FullscreenPassScreenState extends State<FullscreenPassScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  AppBackButton(
                    icon: FontAwesomeIcons.xmark,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                  const Spacer(),
                  Text('Visitor Pass',
                      style: AppText.label.copyWith(
                        color: AppColors.emeraldDeep,
                        fontSize: 14,
                      )),
                  const Spacer(),
                  const SizedBox(width: 44),
                ],
              ),
              const Spacer(),
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.emeraldDeep,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gold, width: 1.6),
                ),
                child: const FaIcon(FontAwesomeIcons.water,
                    size: 18, color: AppColors.neon),
              ),
              const SizedBox(height: 16),
              Text(
                AppInfo.appName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: AppColors.emeraldDeep,
                ),
              ),
              const SizedBox(height: 28),
              QrLikeGraphic(
                seed: AppInfo.passCode,
                size: 250,
                foreground: AppColors.emeraldDeep,
                background: const Color(0xFFFDFBF3),
              ),
              const SizedBox(height: 28),
              Text('PASS CODE',
                  style: AppText.overline.copyWith(
                    color: AppColors.goldSoft,
                    fontSize: 12,
                    letterSpacing: 3,
                  )),
              const SizedBox(height: 8),
              Text(
                AppInfo.passCode,
                style: const TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 6,
                  color: AppColors.emeraldDeep,
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDFBF3),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.gold, width: 1.2),
                ),
                child: Column(
                  children: const [
                    _Instruction(
                        text: 'Show this pass to resort staff during your visit.'),
                    SizedBox(height: 10),
                    _Instruction(
                        text: 'Staff may activate full access on-site.'),
                    SizedBox(height: 10),
                    _Instruction(
                        text: 'Keep the screen visible and bright when requested.'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _Instruction extends StatelessWidget {
  const _Instruction({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FaIcon(FontAwesomeIcons.solidCircleCheck,
            size: 15, color: AppColors.neonSoft),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.35,
              color: Color(0xFF2A3A30),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
