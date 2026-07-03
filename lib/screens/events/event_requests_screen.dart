import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/event_request.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/empty_state_view.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/request_status_badge.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/screen_header.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/solid_card.dart';

/// Secondary screen listing all submitted event requests.
class EventRequestsScreen extends StatelessWidget {
  const EventRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = AppScope.of(context).eventRequests;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppTheme.screenPad, 12, AppTheme.screenPad, 8),
              child: ScreenHeader(
                title: 'My Event Requests',
                subtitle: requests.isEmpty
                    ? null
                    : '${requests.length} request${requests.length == 1 ? '' : 's'} submitted',
                showBack: true,
              ),
            ),
            Expanded(
              child: requests.isEmpty
                  ? const EmptyStateView(
                      icon: FontAwesomeIcons.calendarXmark,
                      title: 'No Event Requests Yet',
                      subtitle: 'Send an event request and track it here.',
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                          AppTheme.screenPad, 12, AppTheme.screenPad, 28),
                      itemCount: requests.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 14),
                      itemBuilder: (context, i) =>
                          _EventRequestCard(request: requests[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventRequestCard extends StatelessWidget {
  const _EventRequestCard({required this.request});

  final EventRequest request;

  @override
  Widget build(BuildContext context) {
    return SolidCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(request.eventTitle, style: AppText.cardTitle),
              ),
              const SizedBox(width: 10),
              RequestStatusBadge(status: request.status),
            ],
          ),
          const SizedBox(height: 14),
          _Row(
            icon: FontAwesomeIcons.solidCalendar,
            label: 'Date',
            value: request.eventDate,
          ),
          _Row(
            icon: FontAwesomeIcons.clock,
            label: 'Time',
            value: request.eventTime,
          ),
          _Row(
            icon: FontAwesomeIcons.userGroup,
            label: 'Guests',
            value: '${request.guestCount}',
          ),
          if (request.contactNote.isNotEmpty)
            _Row(
              icon: FontAwesomeIcons.penToSquare,
              label: 'Note',
              value: request.contactNote,
            ),
          const SizedBox(height: 12),
          Divider(color: AppColors.borderSoft, height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.user,
                  size: 12, color: AppColors.textFaint),
              const SizedBox(width: 8),
              Text('${request.guestName}  •  Submitted ${request.submittedOn}',
                  style: AppText.caption),
            ],
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.icon, required this.label, required this.value});

  final FaIconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: FaIcon(icon, size: 13, color: AppColors.neon),
          ),
          const SizedBox(width: 8),
          SizedBox(width: 62, child: Text(label, style: AppText.label)),
          Expanded(child: Text(value, style: AppText.body)),
        ],
      ),
    );
  }
}
