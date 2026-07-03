import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/constants/app_assets.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';

/// Branded loader shown at startup. After a short delay it calls [onDone].
class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key, required this.onDone});

  final VoidCallback onDone;

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>
    with TickerProviderStateMixin {
  late final AnimationController _pulse;
  late final AnimationController _bar;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    _bar = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..forward();

    Future.delayed(const Duration(milliseconds: 2900), () {
      if (mounted) widget.onDone();
    });
  }

  @override
  void dispose() {
    _pulse.dispose();
    _bar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background building image with a dark emerald overlay for depth.
          Image.asset(AppAssets.loader, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xE6081210),
                  Color(0xB3081210),
                  Color(0xF2081210),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                _Emblem(pulse: _pulse),
                const SizedBox(height: 30),
                Text(
                  'NIAGARA',
                  style: AppText.overline.copyWith(
                    fontSize: 14,
                    letterSpacing: 6,
                    color: AppColors.gold,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Service Resort Casino',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: AppColors.textCream,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                Text(
                  'Preparing your visitor access...',
                  style: AppText.bodyMuted.copyWith(color: AppColors.beige),
                ),
                const SizedBox(height: 18),
                _LoadingBar(controller: _bar),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Emblem extends StatelessWidget {
  const _Emblem({required this.pulse});

  final AnimationController pulse;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(pulse.value);
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.emeraldDeep,
            border: Border.all(color: AppColors.gold, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.neon.withValues(alpha: 0.18 + 0.22 * t),
                blurRadius: 30 + 24 * t,
                spreadRadius: 2 + 6 * t,
              ),
            ],
          ),
          child: child,
        );
      },
      child: ClipOval(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipOval(
            child: Image.asset(AppAssets.resortLogo, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class _LoadingBar extends StatelessWidget {
  const _LoadingBar({required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Container(
          height: 5,
          color: AppColors.surfaceAlt,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: controller.value.clamp(0.05, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.neonSoft, AppColors.neon],
                      ),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
