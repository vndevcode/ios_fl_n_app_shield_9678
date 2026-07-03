import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/events/event_schedule.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_event_model.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/solid_card.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/status_pill.dart';

/// Photo-free event card used on the Events tab.
class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.dayStatus,
    required this.onDetails,
    required this.onRequest,
  });

  final ResortEventModel event;
  final EventDayStatus dayStatus;
  final VoidCallback onDetails;
  final VoidCallback onRequest;

  Color get _statusColor => switch (dayStatus) {
        EventDayStatus.past => AppColors.textMuted,
        EventDayStatus.today => AppColors.neon,
        EventDayStatus.upcoming => AppColors.gold,
      };

  @override
  Widget build(BuildContext context) {
    return SolidCard(
      onTap: onDetails,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.emeraldDeep,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.neonDim, width: 1.1),
                ),
                child: const FaIcon(FontAwesomeIcons.calendarDay,
                    size: 17, color: AppColors.neon),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.title, style: AppText.cardTitle),
                    const SizedBox(height: 4),
                    Text(event.time, style: AppText.caption),
                  ],
                ),
              ),
              StatusPill(
                label: EventSchedule.labelFor(dayStatus),
                color: _statusColor,
              ),
            ],
          ),
          const SizedBox(height: 14),
          _MetaRow(icon: FontAwesomeIcons.locationDot, text: event.location),
          const SizedBox(height: 8),
          _MetaRow(icon: FontAwesomeIcons.solidCalendar, text: event.date),
          const SizedBox(height: 12),
          Text(event.shortDescription,
              style: AppText.bodyMuted,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _CardButton(
                  label: 'View Details',
                  icon: FontAwesomeIcons.circleInfo,
                  onTap: onDetails,
                ),
              ),
              if (dayStatus != EventDayStatus.past) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: _CardButton(
                    label: 'Request',
                    icon: FontAwesomeIcons.paperPlane,
                    primary: true,
                    onTap: onRequest,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.icon, required this.text});
  final FaIconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, size: 12, color: AppColors.neon),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text,
              style: AppText.caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}

class _CardButton extends StatelessWidget {
  const _CardButton({
    required this.label,
    required this.icon,
    required this.onTap,
    this.primary = false,
  });

  final String label;
  final FaIconData icon;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primary ? AppColors.neon : AppColors.surfaceAlt,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: primary ? AppColors.neon : AppColors.border,
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon,
                  size: 13,
                  color: primary ? AppColors.textOnNeon : AppColors.neon),
              const SizedBox(width: 8),
              Flexible(
                child: Text(label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.button.copyWith(
                      fontSize: 13.5,
                      color:
                          primary ? AppColors.textOnNeon : AppColors.textCream,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
