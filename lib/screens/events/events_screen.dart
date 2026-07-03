import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/events/event_schedule.dart';
import 'package:ios_fl_n_app_shield_9678/events/events_data.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_event_model.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/event_detail_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/event_request_modal.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/event_requests_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/widgets/event_card.dart';
import 'package:ios_fl_n_app_shield_9678/screens/events/widgets/week_calendar.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/screen_header.dart';

/// Tab 4 — Resort Events with a current-week calendar.
class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  static const _shortLabels = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  late final int _todayWeekday;
  late final List<WeekDay> _week;
  late int _selected;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayWeekday = now.weekday; // 1..7
    // Monday of the current week.
    final monday = now.subtract(Duration(days: now.weekday - 1));

    _week = List.generate(7, (i) {
      final date = monday.add(Duration(days: i));
      final weekday = i + 1;
      final count = EventSchedule.forWeekday(EventsData.events, weekday).length;
      return WeekDay(
        weekday: weekday,
        dayNumber: date.day,
        shortLabel: _shortLabels[i],
        isToday: weekday == _todayWeekday,
        count: count,
      );
    });

    _selected = _todayWeekday;
  }

  void _openDetail(ResortEventModel e, EventDayStatus status) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EventDetailScreen(event: e, dayStatus: status),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final count = AppScope.of(context).eventRequests.length;
    final dayEvents = EventSchedule.forWeekday(EventsData.events, _selected);

    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.screenPad, 14, AppTheme.screenPad, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ScreenHeader(
                    overline: 'This week',
                    title: 'Resort Events',
                    subtitle:
                        "View this week's resort events and request guest access or seating.",
                  ),
                  const SizedBox(height: 18),
                  WeekCalendar(
                    days: _week,
                    selectedWeekday: _selected,
                    onSelect: (w) => setState(() => _selected = w),
                  ),
                  const SizedBox(height: 16),
                  _RequestsBanner(
                    count: count,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const EventRequestsScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Text(
                        _selected == _todayWeekday
                            ? 'Today'
                            : _fullDayName(_selected),
                        style: AppText.sectionTitle,
                      ),
                      const SizedBox(width: 8),
                      Text('${dayEvents.length} event${dayEvents.length == 1 ? '' : 's'}',
                          style: AppText.caption),
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          if (dayEvents.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppTheme.screenPad, 30, AppTheme.screenPad, 30),
                child: _NoEvents(),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                  AppTheme.screenPad, 12, AppTheme.screenPad, 28),
              sliver: SliverList.separated(
                itemCount: dayEvents.length,
                separatorBuilder: (_, _) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final e = dayEvents[i];
                  final status = EventSchedule.statusFor(
                    EventSchedule.weekdayOf(e) ?? _todayWeekday,
                    _todayWeekday,
                  );
                  return EventCard(
                    event: e,
                    dayStatus: status,
                    onDetails: () => _openDetail(e, status),
                    onRequest: () => showEventRequestModal(context, e),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  String _fullDayName(int weekday) {
    const names = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
      'Saturday', 'Sunday',
    ];
    return names[weekday - 1];
  }
}

class _NoEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            width: 66,
            height: 66,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 1.3),
            ),
            child: const FaIcon(FontAwesomeIcons.calendarDay,
                size: 24, color: AppColors.neon),
          ),
          const SizedBox(height: 16),
          Text('No Events This Day', style: AppText.sectionTitle),
          const SizedBox(height: 8),
          Text(
            'Choose another day from the week calendar to see scheduled resort events.',
            textAlign: TextAlign.center,
            style: AppText.bodyMuted,
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
              const FaIcon(FontAwesomeIcons.ticket,
                  size: 18, color: AppColors.neon),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('View My Event Requests', style: AppText.cardTitle),
                    const SizedBox(height: 2),
                    Text(
                      count == 0
                          ? 'Track event requests you submit'
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
