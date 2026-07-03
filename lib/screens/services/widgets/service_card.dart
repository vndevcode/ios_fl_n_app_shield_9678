import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/guest_service_model.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/solid_card.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/status_pill.dart';

/// Card representing a single guest service on the Services tab.
class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.service,
    required this.onRequest,
  });

  final GuestServiceModel service;
  final VoidCallback onRequest;

  @override
  Widget build(BuildContext context) {
    return SolidCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.emeraldDeep,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.neonDim, width: 1.2),
                ),
                child: FaIcon(service.icon, size: 20, color: AppColors.neon),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(service.title, style: AppText.cardTitle),
                    const SizedBox(height: 8),
                    StatusPill(
                      label: service.status,
                      color: AppColors.gold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(service.shortDescription, style: AppText.bodyMuted),
          const SizedBox(height: 16),
          PrimaryButton(
            label: service.requestButtonLabel,
            icon: FontAwesomeIcons.paperPlane,
            onPressed: onRequest,
          ),
        ],
      ),
    );
  }
}
