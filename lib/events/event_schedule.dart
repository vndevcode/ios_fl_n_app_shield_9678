import 'package:ios_fl_n_app_shield_9678/models/resort_event_model.dart';

/// Display status for an event relative to the current day.
enum EventDayStatus { past, today, upcoming }

/// Helpers to place the sample events onto the current calendar week and to
/// derive Past / Today / Upcoming status.
abstract final class EventSchedule {
  static const List<String> _weekdayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  /// Weekday index (1 = Monday … 7 = Sunday) parsed from an event's date
  /// label, or null if it could not be resolved.
  static int? weekdayOf(ResortEventModel event) {
    final first = event.date.split(',').first.trim();
    final idx = _weekdayNames.indexOf(first);
    return idx == -1 ? null : idx + 1;
  }

  /// Whether the event is scheduled for the current week (vs. "Next Week").
  static bool isThisWeek(ResortEventModel event) =>
      !event.date.toLowerCase().contains('next week');

  /// Events for a given weekday index within the current week.
  static List<ResortEventModel> forWeekday(
    List<ResortEventModel> events,
    int weekday,
  ) {
    return events
        .where((e) => isThisWeek(e) && weekdayOf(e) == weekday)
        .toList();
  }

  /// Status of an event's weekday relative to [todayWeekday] (1..7).
  static EventDayStatus statusFor(int eventWeekday, int todayWeekday) {
    if (eventWeekday < todayWeekday) return EventDayStatus.past;
    if (eventWeekday == todayWeekday) return EventDayStatus.today;
    return EventDayStatus.upcoming;
  }

  static String labelFor(EventDayStatus status) => switch (status) {
        EventDayStatus.past => 'Past',
        EventDayStatus.today => 'Today',
        EventDayStatus.upcoming => 'Upcoming',
      };
}
