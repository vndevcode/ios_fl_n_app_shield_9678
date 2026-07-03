import 'package:ios_fl_n_app_shield_9678/models/request_status.dart';

/// A guest access / seating request submitted from an event detail screen.
class EventRequest {
  EventRequest({
    required this.id,
    required this.eventTitle,
    required this.eventDate,
    required this.eventTime,
    required this.guestName,
    required this.guestCount,
    required this.contactNote,
    required this.status,
    required this.submittedOn,
  });

  final String id;
  final String eventTitle;
  final String eventDate;
  final String eventTime;
  final String guestName;
  final int guestCount;
  final String contactNote;
  final RequestStatus status;
  final String submittedOn;
}
