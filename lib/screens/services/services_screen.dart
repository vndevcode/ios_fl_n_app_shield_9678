import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/guest_services/guest_services_data.dart';
import 'package:ios_fl_n_app_shield_9678/screens/services/service_request_modal.dart';
import 'package:ios_fl_n_app_shield_9678/screens/services/service_requests_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/services/widgets/service_card.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/screen_header.dart';

/// Tab 1 — Guest Services. Browse resort services and submit requests.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = GuestServicesData.services;
    final count = AppScope.of(context).serviceRequests.length;

    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.screenPad, 14, AppTheme.screenPad, 6),
            sliver: SliverToBoxAdapter(
              child: const ScreenHeader(
                overline: 'Niagara Service Resort',
                title: 'Guest Services',
                subtitle:
                    'Request assistance, comfort support, dining help, and resort services during your visit.',
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.screenPad, 14, AppTheme.screenPad, 4),
            sliver: SliverToBoxAdapter(
              child: _RequestsBanner(
                count: count,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ServiceRequestsScreen(),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.screenPad, 12, AppTheme.screenPad, 28),
            sliver: SliverList.separated(
              itemCount: services.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, i) => ServiceCard(
                service: services[i],
                onRequest: () =>
                    showServiceRequestModal(context, services[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestsBanner extends StatelessWidget {
  const _RequestsBanner({required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.emeraldDark,
      borderRadius: BorderRadius.circular(AppTheme.smallRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.smallRadius),
            border: Border.all(color: AppColors.neonDim, width: 1.2),
          ),
          child: Row(
            children: [
              const FaIcon(FontAwesomeIcons.clipboardList,
                  size: 18, color: AppColors.neon),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('View My Service Requests',
                        style: AppText.cardTitle),
                    const SizedBox(height: 2),
                    Text(
                      count == 0
                          ? 'Track requests you submit'
                          : '$count submitted request${count == 1 ? '' : 's'}',
                      style: AppText.caption,
                    ),
                  ],
                ),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight,
                  size: 14, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
