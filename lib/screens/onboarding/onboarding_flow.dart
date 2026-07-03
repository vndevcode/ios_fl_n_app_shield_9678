import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/constants/app_assets.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';

class _OnbData {
  const _OnbData(this.image, this.title, this.subtitle, this.button);
  final String image;
  final String title;
  final String subtitle;
  final String button;
}

/// Three onboarding pages. Completes onboarding via [onComplete] on Skip
/// or Get Started.
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _controller = PageController();
  int _page = 0;

  static const List<_OnbData> _pages = [
    _OnbData(
      AppAssets.onboardingScreen1,
      'Request Guest Services',
      'Book resort assistance, dining support, comfort help, and visitor services during your stay.',
      'Next',
    ),
    _OnbData(
      AppAssets.onboardingScreen2,
      'Use Your Visitor Pass',
      'Keep your pass code ready for staff support, access confirmation, and on-site service requests.',
      'Next',
    ),
    _OnbData(
      AppAssets.onboardingScreen3,
      'Explore Events and Places',
      'Discover resort places, view upcoming events, save locations, and ask quick guest-support questions.',
      'Get Started',
    ),
  ];

  bool get _isLast => _page == _pages.length - 1;

  void _next() {
    if (_isLast) {
      widget.onComplete();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Stack(
        children: [
          // Full-screen image per page.
          Positioned.fill(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (context, i) {
                return Image.asset(_pages[i].image, fit: BoxFit.cover);
              },
            ),
          ),
          // Darkening gradient so the bottom panel reads well.
          const Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x99081210),
                      Color(0x33081210),
                      Color(0xF2081210),
                    ],
                    stops: [0.0, 0.4, 0.82],
                  ),
                ),
              ),
            ),
          ),
          // Skip button.
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: TextButton(
                  onPressed: widget.onComplete,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.forestDeep,
                    foregroundColor: AppColors.textCream,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                      side: const BorderSide(color: AppColors.border),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                  ),
                  child: Text('Skip', style: AppText.label.copyWith(
                    color: AppColors.textCream,
                  )),
                ),
              ),
            ),
          ),
          // Bottom content panel.
          Align(
            alignment: Alignment.bottomCenter,
            child: _BottomPanel(
              data: _pages[_page],
              pageIndex: _page,
              pageCount: _pages.length,
              showBack: _page > 0,
              onBack: _back,
              onNext: _next,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPanel extends StatelessWidget {
  const _BottomPanel({
    required this.data,
    required this.pageIndex,
    required this.pageCount,
    required this.showBack,
    required this.onBack,
    required this.onNext,
  });

  final _OnbData data;
  final int pageIndex;
  final int pageCount;
  final bool showBack;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        border: Border(top: BorderSide(color: AppColors.border, width: 1.2)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 26, 24, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page indicator.
              Row(
                children: [
                  for (var i = 0; i < pageCount; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 7),
                      width: i == pageIndex ? 26 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: i == pageIndex
                            ? AppColors.neon
                            : AppColors.border,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Text(data.title, style: AppText.display),
              const SizedBox(height: 12),
              Text(data.subtitle, style: AppText.bodyMuted),
              const SizedBox(height: 26),
              Row(
                children: [
                  if (showBack) ...[
                    _CircleBack(onTap: onBack),
                    const SizedBox(width: 14),
                  ],
                  Expanded(
                    child: PrimaryButton(
                      label: data.button,
                      onPressed: onNext,
                      icon: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleBack extends StatelessWidget {
  const _CircleBack({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceAlt,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 54,
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border, width: 1.3),
          ),
          child: const Icon(Icons.arrow_back_rounded,
              color: AppColors.textCream, size: 22),
        ),
      ),
    );
  }
}
