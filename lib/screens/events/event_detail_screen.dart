import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/events/event_schedule.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_event_model.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/event_request_modal.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/screen_header.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/solid_card.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/status_pill.dart';

/// Secondary screen showing full event details and the request action.
class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({
    super.key,
    required this.event,
    required this.dayStatus,
  });

  final ResortEventModel event;
  final EventDayStatus dayStatus;

  Color get _statusColor => switch (dayStatus) {
        EventDayStatus.past => AppColors.textMuted,
        EventDayStatus.today => AppColors.neon,
        EventDayStatus.upcoming => AppColors.gold,
      };

  @override
  Widget build(BuildContext context) {
    final isPast = dayStatus == EventDayStatus.past;
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
              AppTheme.screenPad, 12, AppTheme.screenPad, 30),
          children: [
            ScreenHeader(
              showBack: true,
              title: event.title,
              trailing: StatusPill(
                label: EventSchedule.labelFor(dayStatus),
                color: _statusColor,
              ),
            ),
            const SizedBox(height: 20),
            SolidCard(
              child: Column(
                children: [
                  _DetailRow(
                    icon: FontAwesomeIcons.solidCalendar,
                    label: 'Date',
                    value: event.date,
                  ),
                  Divider(color: AppColors.borderSoft, height: 22),
                  _DetailRow(
                    icon: FontAwesomeIcons.clock,
                    label: 'Time',
                    value: event.time,
                  ),
                  Divider(color: AppColors.borderSoft, height: 22),
                  _DetailRow(
                    icon: FontAwesomeIcons.locationDot,
                    label: 'Location',
                    value: event.location,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Text('About this event', style: AppText.sectionTitle),
            const SizedBox(height: 10),
            Text(event.fullDescription, style: AppText.body),
            const SizedBox(height: 22),
            Text('Guest notes', style: AppText.sectionTitle),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.emeraldDeep,
                borderRadius: BorderRadius.circular(AppTheme.smallRadius),
                border: Border.all(color: AppColors.neonDim, width: 1.1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FaIcon(FontAwesomeIcons.circleInfo,
                      size: 15, color: AppColors.neon),
                  const SizedBox(width: 12),
                  Expanded(child: Text(event.guestNotes, style: AppText.body)),
                ],
              ),
            ),
            const SizedBox(height: 26),
            if (isPast)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppTheme.smallRadius),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.clockRotateLeft,
                        size: 15, color: AppColors.textMuted),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'This event has already taken place. Requests are closed.',
                        style: AppText.bodyMuted,
                      ),
                    ),
                  ],
                ),
              )
            else
              PrimaryButton(
                label: 'Send Event Request',
                icon: FontAwesomeIcons.paperPlane,
                onPressed: () => showEventRequestModal(context, event),
              ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final FaIconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.emeraldDeep,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: AppColors.neonDim, width: 1.1),
          ),
          child: FaIcon(icon, size: 15, color: AppColors.neon),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppText.label),
              const SizedBox(height: 3),
              Text(value, style: AppText.body),
            ],
          ),
        ),
      ],
    );
  }
}
